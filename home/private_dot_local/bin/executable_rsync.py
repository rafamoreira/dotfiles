#!/usr/bin/env python3
"""
Smart Rsync with Delete Tracking

This script provides two main functions:
1. Track files you want to delete (adds them to exclusion list)
2. Run rsync with exclusions for tracked deleted files

Usage:
    python smart_rsync.py delete <filename>     # Track a file for deletion
    python smart_rsync.py sync                  # Run rsync with exclusions
    python smart_rsync.py list                  # Show excluded files
    python smart_rsync.py clear                 # Clear exclusion list
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path
from datetime import datetime

class SmartRsync:
    def __init__(self, local_dir, server_path, exclude_file="rsync_excluded.txt"):
        self.local_dir = Path(local_dir)
        self.server_path = self._get_server_path(local_dir, server_path)
        self.exclude_file = Path(exclude_file)
        
    def _get_server_path(self, local_dir, default_server_path):
        """Get server path from server.cfg file if it exists, otherwise use default"""
        server_cfg = Path(local_dir) / "server.cfg"
        
        if server_cfg.exists():
            try:
                with open(server_cfg, 'r') as f:
                    server_path = f.read().strip()
                    if server_path:
                        print(f"Using server path from server.cfg: {server_path}")
                        return server_path
            except Exception as e:
                print(f"Warning: Could not read server.cfg: {e}")
        
        return default_server_path
        
    def delete_and_track(self, filename):
        """Delete a file and add it to the exclusion list"""
        file_path = self.local_dir / filename
        
        if not file_path.exists():
            print(f"Error: File '{filename}' not found in {self.local_dir}")
            return False
            
        try:
            # Remove the file
            if file_path.is_file():
                file_path.unlink()
                print(f"Deleted file: {filename}")
            elif file_path.is_dir():
                import shutil
                shutil.rmtree(file_path)
                print(f"Deleted directory: {filename}")
            
            # Add to exclusion list
            self._add_to_exclude_list(filename)
            return True
            
        except Exception as e:
            print(f"Error deleting {filename}: {e}")
            return False
    
    def _add_to_exclude_list(self, filename):
        """Add filename to the exclusion list"""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        with open(self.exclude_file, 'a') as f:
            f.write(f"{filename}\n")
        
        # Also maintain a log with timestamps
        log_file = self.exclude_file.with_suffix('.log')
        with open(log_file, 'a') as f:
            f.write(f"{timestamp} - Excluded: {filename}\n")
        
        print(f"Added '{filename}' to exclusion list")
    
    def sync(self):
        """Run rsync with exclusions"""
        cmd = [
            'rsync', 
            '-avhz', 
            '--progress', 
            '--stats'
        ]
        
        # Add exclude file if it exists and has content
        if self.exclude_file.exists() and self.exclude_file.stat().st_size > 0:
            cmd.extend(['--exclude-from', str(self.exclude_file)])
            print(f"Using exclusion file: {self.exclude_file}")
        
        cmd.extend([f"{self.server_path}/", str(self.local_dir) + "/"])
        
        print(f"Running: {' '.join(cmd)}")
        print("-" * 50)
        
        try:
            result = subprocess.run(cmd, check=True)
            print("-" * 50)
            print("Sync completed successfully!")
            return True
        except subprocess.CalledProcessError as e:
            print(f"Rsync failed with error code {e.returncode}")
            return False
        except FileNotFoundError:
            print("Error: rsync command not found. Please install rsync.")
            return False
    
    def list_excluded(self):
        """List all excluded files"""
        if not self.exclude_file.exists():
            print("No exclusion file found.")
            return
        
        print("Excluded files:")
        with open(self.exclude_file, 'r') as f:
            for i, line in enumerate(f, 1):
                print(f"{i:3d}. {line.strip()}")
    
    def clear_exclusions(self):
        """Clear the exclusion list"""
        if self.exclude_file.exists():
            self.exclude_file.unlink()
            print("Exclusion list cleared.")
        else:
            print("No exclusion file to clear.")

def main():
    parser = argparse.ArgumentParser(description='Smart Rsync with Delete Tracking')
    parser.add_argument('command', choices=['delete', 'sync', 'list', 'clear'],
                       help='Command to execute')
    parser.add_argument('filename', nargs='?', help='Filename to delete (for delete command)')
    parser.add_argument('--local-dir', default='./',
                       help='Local directory to sync (default: ./)')
    parser.add_argument('--server', default='server:/path/to/folder1',
                       help='Server path (default: server:/path/to/folder1)')
    parser.add_argument('--exclude-file', default='rsync_excluded.txt',
                       help='Exclusion file name (default: rsync_excluded.txt)')
    
    args = parser.parse_args()
    
    # Create SmartRsync instance
    rsync = SmartRsync(args.local_dir, args.server, args.exclude_file)
    
    # Execute command
    if args.command == 'delete':
        if not args.filename:
            print("Error: filename required for delete command")
            sys.exit(1)
        rsync.delete_and_track(args.filename)
    
    elif args.command == 'sync':
        rsync.sync()
    
    elif args.command == 'list':
        rsync.list_excluded()
    
    elif args.command == 'clear':
        rsync.clear_exclusions()

if __name__ == "__main__":
    main()

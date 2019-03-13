(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

;;; which-key
(use-package which-key
  :straight t
  :config (which-key-mode))

;;; org mode

(require 'subr-x)
(straight-use-package 'git)

(defun org-git-version ()
  "The Git version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (git-run "describe"
              "--match=release\*"
              "--abbrev=6"
              "HEAD"))))

(defun org-release ()
  "The release version of org-mode.
Inserted by installing org-mode or when a release is made."
  (require 'git)
  (let ((git-repo (expand-file-name
                   "straight/repos/org/" user-emacs-directory)))
    (string-trim
     (string-remove-prefix
      "release_"
      (git-run "describe"
               "--match=release\*"
               "--abbrev=0"
               "HEAD")))))

(provide 'org-version)

(straight-use-package 'org-plus-contrib) ; or org-plus-contrib if desired

;; ido configs
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer) ;;; i don't know what this does

(use-package ace-window
  :straight t)

(global-set-key (kbd "C-x o") 'ace-window)

(use-package auto-complete
  :straight t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package color-theme-modern
  :straight t)

(use-package molokai-theme
  :straight t
  :config (load-theme 'molokai t))

(use-package dracula-theme
  :straight t) 


;; :config (load-theme 'dracula t))

(use-package projectile
  :straight t
  :config (projectile-mode +1))

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package ivy
  :straight t)

(use-package counsel
  :straight t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(use-package counsel-projectile
  :straight t
  :config (counsel-projectile-mode))

(global-hl-line-mode t) ;; hightlight the current line
(electric-pair-mode 1) ;; auto add matching pair
(show-paren-mode 1) ;; hightlight matching parens
(global-display-line-numbers-mode) ;; show line numbers
(setq display-line-numbers-type 'relative) ;; relative line numbers
(column-number-mode 1) ;; show column number
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))


;;;; ruby

(use-package enh-ruby-mode
  :straight t)

(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

(setq enh-ruby-add-encoding-comment-on-save nil) ;;; disable auto insert of magic comments on save


(use-package rinari
  :straight t)

(use-package ruby-end
  :straight t)

(use-package yaml-mode
  :straight t
  :config
  (add-hook 'yaml-mode-hook
	    (lambda ()
	      (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

;;; elixir
(use-package elixir-mode
  :straight t)

(use-package alchemist
  :straight t)

(use-package zencoding-mode
  :straight t
  :config
  (add-hook 'sgml-mode-hook 'zencoding-mode))

(use-package neotree
  :straight t
  :config
  (global-set-key [f8] 'neotree-toggle))

(use-package evil
  :straight t
  :config
  (evil-mode 1))

(use-package evil-surround
  :straight t
  :config (global-evil-surround-mode 1))

(use-package undo-tree
  :straight t
  :config
  (global-undo-tree-mode))

(use-package web-mode
  :straight t)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

(use-package wakatime-mode
  :straight t
  :init (global-wakatime-mode)
  :config (setq wakatime-cli-path "/home/rmc/.local/bin/wakatime"))

(use-package emmet-mode
  :straight t)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook 'emmet-mode)


;;; indent stuff
(setq web-mode-markup-indent-offset 2)

(setq visible-bell 1)

(use-package magit
  :straight t)

(use-package highlight-indent-guides
  :straight t
  :init (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  :config (setq highlight-indent-guides-method 'character))

(set-frame-font "Source Code Pro SemiBold" nil t)

(use-package rspec-mode
  :straight t)

(use-package projectile-rails
  :straight t
  :config (projectile-rails-global-mode))

(use-package fill-column-indicator
  :straight t
  :init (add-hook 'ruby-mode-hook 'fci-mode)
  :config (setq fci-rule-column 80))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my-office-code-style ()
  (interactive)
  (message "Office code style!")
  ;; use tab instead of space
  (setq-local indent-tabs-mode t)
  ;; indent 4 spaces width
  (my-setup-indent 4))

(defun my-personal-code-style ()
  (interactive)
  (message "My personal code style!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2))

(defun my-setup-develop-environment ()
  (interactive)
    (let ((hostname (with-temp-buffer
                    (shell-command "hostname" t)
                    (goto-char (point-max))
                    (delete-char -1)
                    (buffer-string))))

  (if (string-match-p "archlinux" hostname)
      (my-personal-code-style))

  (if (string-match-p "office-pc" hostname)
      (my-office-code-style))))

;; prog-mode-hook requires emacs24+
(add-hook 'prog-mode-hook 'my-setup-develop-environment)
;; a few major-modes does NOT inherited from prog-mode
(add-hook 'lua-mode-hook 'my-setup-develop-environment)
(add-hook 'web-mode-hook 'my-setup-develop-environment)


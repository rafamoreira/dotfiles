(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e")))
 '(package-selected-packages
   (quote
    (counsel ivy projectile evil fill-column-indicator column-marker emmet-mode magithub magit ruby-end toggle-quotes neotree flycheck rubocop which-key web-mode use-package undo-tree try projectile-rails org-bullets counsel-projectile color-theme-sanityinc-tomorrow auto-complete ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(setq inhibit-startup-message t) ;; do not exibit the inicial message

(tool-bar-mode -1) ;; hide toolbar

;; hide menu bar on terminal session
(unless (display-graphic-p)
  (menu-bar-mode -1))

(setq visible-bell t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-bright t))

(use-package projectile
  :ensure t
  :config (projectile-mode))

(use-package projectile-rails
  :ensure t
  :config (projectile-rails-global-mode))

(use-package web-mode
  :ensure t
  :config
  (web-mode-toggle-current-element-highlight))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))




(use-package ivy
	     :ensure t)

(use-package counsel
  :ensure t)

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
  :ensure t
  :config (counsel-projectile-mode))

(use-package undo-tree
  :ensure t)

;; ido configs
;;(setq indo-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

(defalias 'list-buffers 'ibuffer)

(set-frame-font "Dejavu sans mono 12" nil t)
(global-hl-line-mode t) ;; hightlight the current line
(electric-pair-mode 1) ;; auto add matching pair
(show-paren-mode 1) ;; hightlight matching parens
(setq show-paren-style 'mixed)
(global-linum-mode 1) ;; show line numbers
(column-number-mode 1) ;; show column number
(save-place-mode 1) ;; remeber cursos position
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups")))) ;; save backups single dir
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/emacs-saves" t)))
(savehist-mode 1) ;; save minibuffer history
(delete-selection-mode 1) ;; type over selected text

;; tabs / spaces

(setq-default indent-tabs-mode nil)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; make return key also do indent, globally
(electric-indent-mode 1)

;; make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)

;; undo tree
(global-undo-tree-mode 1)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

(use-package rubocop
  :ensure t)
(add-hook 'ruby-mode-hook #'rubocop-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(flycheck-add-mode 'eruby-erubis 'web-mode)

(defun my/configure-web-mode-flycheck-checkers ()
  ;; in order to have flycheck enabled in web-mode, add an entry to this
  ;; cond that matches the web-mode engine/content-type/etc and returns the
  ;; appropriate checker.
  (-when-let (checker (cond
                       ((string= web-mode-content-type "erb")
                        'eruby-erubis)))
    (flycheck-mode)
    (flycheck-select-checker checker)))

(add-hook 'web-mode-hook #'my/configure-web-mode-flycheck-checkers)

(use-package neotree
  :ensure t)

(global-set-key [f8] 'neotree-toggle)

(use-package toggle-quotes
  :ensure t)

(global-set-key (kbd "C-;") 'toggle-quotes)
(global-set-key (kbd "C-'") 'toggle-quotes)
(setq ruby-insert-encoding-magic-comment nil) ;; stop ruby utf-8 encoding

(use-package ruby-end
  :ensure t)

(use-package magit
  :ensure t)

(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))

(use-package emmet-mode
  :ensure t
  :config (emmet-mode))

(use-package fill-column-indicator
  :ensure t)

(setq fci-rule-width 5)
(setq fci-rule-color "red")
(setq fci-rule-column 80)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)


(use-package evil
  :ensure t
  :config (evil-mode 1))

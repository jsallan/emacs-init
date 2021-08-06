;; Testing if this made it to github

(setq inhibit-startup-message t)

(scroll-bar-mode -1)      ; disable visible scroll bar
(tool-bar-mode -1)        ; disable the toolbar
(tooltip-mode -1)         ; disable tooltips
(set-fringe-mode 10)      ; give some breathing room
(menu-bar-mode -1)        ; disable the menu bar

(setq visible-bell t)     ; setup the visible bell

(set-face-attribute 'default nil :font "DejaVu Sans Mono-12" :height 100)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")                                       ("elpa" . "https://elpa.gnu.org/packages/")))

 
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line-numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-number-mode 0))))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))  ;; Don't start searches with ^

(use-package all-the-icons)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
                :map ivy-minibuffer-map
                ("TAB" . ivy-alt-done)
                ("C-l" . ivy-alt-done)
                ("C-j" . ivy-next-line)
                ("C-k" . ivy-previous-line)
                :map ivy-switch-buffer-map
                ("C-k" . ivy-previous-line)
                ("C-l" . ivy-done)
                ("C-d" . ivy-switch-buffer-kill)
                :map ivy-reverse-i-search-map
                ("C-k" . ivy-previous-line)
                ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Configure Theme and icons

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-dracula t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-deay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" default))
 '(package-selected-packages
   '(doom-themes helpful ivy-rich which-key rainbow-delimiters use-package doom-modeline counsel)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

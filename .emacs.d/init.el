;; set up package.el to work with MELPA
(require 'package)
(require 'install)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; Enable Evil aka vim keybindings
  (use-package evil
    :init
    (progn
      (setq evil-undo-system 'undo-tree)
      (setq evil-want-keybinding nil)
      )
    :config
    (progn
      (evil-mode 1)))

;; Enable general.el
(use-package general)
(general-evil-setup)

;; Now Usable `jk` Is possible!
(general-imap "j"
  (general-key-dispatch 'self-insert-command
    :timeout 0.25
    "k" 'evil-normal-state))

;; for better html suppot such as . for class and # for id and > for child
(use-package emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(use-package lsp-mode
  :commands(lsp lsp-deferred)
  :init(setq lsp-keymap-prefix "C-c l"))


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map))


(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-collection
  :ensure t
  :after evil
  :init
  (evil-collection-init))

;; For Custon theming
(use-package autothemer)
(load-theme 'neon t)


;; for brackets colors
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(custom-set-faces
 '(js2-object-property ((t (:inherit font-lock-variable-name-face))))

;; auto end bracket
(electric-pair-mode 1)

;; hide different menus
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Custom-safe-themes
   '("6c71a6437c3edf3fb28156ea83dbcf752fef19590fc1bfc919b0a53935f265d2" "dde643b0efb339c0de5645a2bc2e8b4176976d5298065b8e6ca45bc4ddf188b7" default))
 '(custom-safe-themes
   '("70abf20e1f2ae8280c02142130c5463787199e5f54e8d5c2cc739bf2d833c0a5" "c464ed2a5962538a8213945c88360d32b1e9bfe4b076b62fc4a5b9a4067cb0c2" "6c71a6437c3edf3fb28156ea83dbcf752fef19590fc1bfc919b0a53935f265d2" default))
 '(package-selected-packages
   '(magit projectile rainbow-delimiters company lsp-mode prettier emmet-mode js2-mode ## autothemer modus-themes use-package undo-fu general evil-collection)))

;; adding line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#191830" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 112 :width normal :foundry "ADBO" :family "jetbrains mono")))))

;; set up package.el to work with MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; Enable Evil aka vim keybindings
(use-package evil
  :ensure t
  :init
    (progn
      (setq evil-undo-system 'undo-tree)
      (setq evil-want-keybinding nil)
      )
    :config
    (progn
      (evil-mode 1)))

;; Enable general.el
(require 'general)
(general-evil-setup)

;; Now Usable `jk` is possible!
(general-imap "j"
  (general-key-dispatch 'self-insert-command
    :timeout 0.25
    "k" 'evil-normal-state))

;; for better html suppot such as . for class and # for id and > for child
(use-package emmet-mode
  :ensure t)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(use-package lsp-mode
  :ensure t
  :commands(lsp lsp-deferred)
  :init(setq lsp-keymap-prefix "C-c l"))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :ensure t)

(use-package treemacs)

(use-package magit
  :ensure t
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-collection
  :ensure t
  :after evil
  :init
  (evil-collection-init))

;; For Custon theming
(use-package autothemer
  :ensure t)
(load-theme 'neon t)

;; for brackets colors
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#191830" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 112 :width normal :foundry "ADBO" :family "jetbrains mono"))))
 '(js2-object-property ((t (:inherit font-lock-variable-name-face))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "#FFD700"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "#da70d6"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#179fff")))))

;; Auto end bracket
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
 '(company-idle-delay 0)
 '(custom-safe-themes
   '("70abf20e1f2ae8280c02142130c5463787199e5f54e8d5c2cc739bf2d833c0a5" "c464ed2a5962538a8213945c88360d32b1e9bfe4b076b62fc4a5b9a4067cb0c2" "6c71a6437c3edf3fb28156ea83dbcf752fef19590fc1bfc919b0a53935f265d2" default))
 '(package-selected-packages
   '(treemacs magit rainbow-delimiters company lsp-mode prettier emmet-mode js2-mode ## autothemer modus-themes use-package undo-fu general evil-collection))
 '(rainbow-delimiters-max-face-count 3))

;; adding line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)


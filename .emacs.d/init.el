;; Set up package.el to work with MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)


;; Download general.el
(unless (package-installed-p 'general)
  (package-install 'general))

;; Enable general.el
(require 'general)
(general-evil-setup)

;; now usable `jk` is possible!
(general-imap "j"
  (general-key-dispatch 'self-insert-command
    :timeout 0.25
    "k" 'evil-normal-state))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Custom-safe-themes
   '("6c71a6437c3edf3fb28156ea83dbcf752fef19590fc1bfc919b0a53935f265d2" "dde643b0efb339c0de5645a2bc2e8b4176976d5298065b8e6ca45bc4ddf188b7" default))
 '(package-selected-packages
   '(## autothemer shades-of-purple-theme modus-themes use-package undo-fu general evil-collection)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; adding line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)


(use-package autothemer
  :ensure t)
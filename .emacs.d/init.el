;; set up package.el to work with MELPA
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; Enable Evil aka vim keybindings
(require 'evil)
(evil-mode 1)

;; Download general.el
(unless (package-installed-p 'general)
  (package-install 'general))

;; Enable general.el
(require 'general)
(general-evil-setup)

;; Now Usable `jk` Is possible!
(general-imap "j"
  (general-key-dispatch 'self-insert-command
    :timeout 0.25
    "k" 'evil-normal-state))

;; for custon theming
(require 'autothemer)
(load-theme 'hallo t)

;; for better html suppot such as . for class and # for id and > for child
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; auto end bracket
(electric-pair-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Custom-safe-themes
   '("6c71a6437c3edf3fb28156ea83dbcf752fef19590fc1bfc919b0a53935f265d2" "dde643b0efb339c0de5645a2bc2e8b4176976d5298065b8e6ca45bc4ddf188b7" default))
 '(package-selected-packages
   '(prettier emmet-mode js2-mode impatient-mode ## autothemer shades-of-purple-theme modus-themes use-package undo-fu general evil-collection)))

;; adding line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#191830" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 112 :width normal :foundry "ADBO" :family "jetbrains mono")))))

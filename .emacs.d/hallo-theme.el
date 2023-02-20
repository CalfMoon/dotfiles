(require 'autothemer)

(autothemer-deftheme
 hallo "A theme to set the mood for Halloween"

 ((((class color) (min-colors #xFFFFFF))) ;; We're only concerned with graphical Emacs

  ;; Define our color palette
  (hallo-orange     "orange1")
  (thm-select  "MediumPurple4")
  (thm-background   "#191830")
  (thm-foreground   "#ffffff")
  (thm-cursor       "#fad000")
  (thm-cursor-text  "#1e1e3f")
  (thm-mode-line    "#5f005f")
  (thm-black "#000000")
  (thm-red "#ff0000")
  (thm-green "#00ff00")
  (thm-yellow "#ffff00")
  (thm-blue "#0000dd")
  (thm-magenta "#ff00ff")
  (thm-cyan "#00ffff")
  (thm-white "#ffffff")
  (thm-br-black   "#555555")
  (thm-br-red     "#ff4444")
  (thm-br-green   "#66ff66")
  (thm-br-yellow  "#ffff99")
  (thm-br-blue    "#4444ff")
  (thm-br-magenta "#ff55ff")
  (thm-br-cyan    "#77ffff")
  (thm-br-white   "#dddddd")
  (thm-comment "#b362ff"))
 ;; Customize faces
 ((default                   (:foreground thm-foreground :background thm-background))
  (cursor                    (:background thm-cursor))
  (region                    (:background thm-select))
  (mode-line                 (:background thm-mode-line))
  (font-lock-keyword-face    (:foreground thm-cyan))
  (font-lock-constant-face   (:foreground thm-green))
  (font-lock-string-face     (:foreground thm-green))
  (font-lock-builtin-face    (:foreground thm-cyan))
  (font-lock-comment-face    (:foreground thm-comment))
  
  (org-level-1               (:foreground hallo-orange))))

(provide-theme 'hallo)

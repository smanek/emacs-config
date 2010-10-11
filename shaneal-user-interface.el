(provide 'shaneal-user-interface)
;;general stuff
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(show-paren-mode t)
(mouse-avoidance-mode 'cat-and-mouse)
(fset 'yes-or-no-p 'y-or-n-p)

(when (fboundp 'mouse-wheel-mode)
  (mouse-wheel-mode t))
(line-number-mode t)
(column-number-mode t)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode t))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode nil))
(transient-mark-mode t)
(global-font-lock-mode 1)

;;color-theme
(add-to-list 'load-path (concat *emacs-lib-base* "color-theme/"))
(if window-system
    (progn 
      (require 'color-theme)
      (color-theme-initialize)
      (color-theme-charcoal-black)))
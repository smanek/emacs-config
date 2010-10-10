(provide 'shaneal-haskell)

;;Haskell
(load (concat *emacs-lib-base* "haskell-mode/haskell-site-file"))
(load "~/elisp/hs-lint.el")
(defun my-haskell-mode-hook ()
  (turn-on-haskell-indentation)
  (turn-on-haskell-doc-mode)
  (local-set-key "\C-cl" 'hs-lint))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
;(setf hs-lint-replace-with-suggestions t)


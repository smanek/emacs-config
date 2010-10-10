(provide 'shaneal-latex)

(setq TeX-source-specials-mode t)
(setq-default TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(provide 'shaneal-clojure)

(defadvice slime-read-interactive-args (before add-clojure)
  (require 'assoc)
  (aput 'slime-lisp-implementations 'clojure
        (list (swank-clojure-cmd) :init 'swank-clojure-init)))

(add-to-list 'load-path (concat *emacs-lib-base* "clojure-mode/"))
(require 'clojure-mode)
(add-to-list 'load-path (concat *emacs-lib-base* "swank-clojure/"))
(require 'swank-clojure)

(eval-after-load "swank-clojure"
  '(progn
     ;; Make REPL more friendly to Clojure (ELPA does not include this?)
     ;; The function is defined in swank-clojure.el but not used?!?
     (add-hook 'slime-repl-mode-hook 
               'swank-clojure-slime-repl-modify-syntax t)))

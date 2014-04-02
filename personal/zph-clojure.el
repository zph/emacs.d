;;; zph-clojure.el --- Clj configs


;; more aesthetic spacing for compojure macros

;;; Commentary:
;; 

;;; Code:

(define-clojure-indent
  (defroutes 'defun)
  (context 'defun)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljx\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.edn\\'"  . clojure-mode))
(provide 'zph-clojure)

;;; zph-clojure.el ends here

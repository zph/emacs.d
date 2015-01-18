;;; zph-junk-drawer.el --- Where does this go?

;;; Commentary:

;;; Code:

;; TODO: relocate if I keep using emmet mode
(global-pretty-mode t)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (ditaa . t)
   (dot . t)
   (emacs-lisp . t)
   (gnuplot . t)
   (haskell . nil)
   (latex . t)
   (ledger . t)         ;this is the important one for this tutorial
   (ocaml . nil)
   (octave . t)
   (python . t)
   (ruby . t)
   (screen . nil)
   (sh . t)
   (sql . nil)
   (sqlite . t)))
(setq sentence-end-double-space nil)  ;; because it's 2015 and double spaces after period are passe

(provide 'zph-junk-drawer)
;;; zph-junk-drawer.el ends here

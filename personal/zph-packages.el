;;; zph-packages.el --- Auto-install packages
;; auto-install packages
;;; Code:
(dolist (package '(
         evil
         evil-leader
         evil-numbers
         expand-region
         fastnav
         magit
         projectile
         smex
         undo-tree
         window-number
         yasnippet
         icicles
         clojure-mode
         ))
  (unless (package-installed-p package)
    (package-install package)))
(provide 'zph-packages)
;;; zph-packages.el ends here

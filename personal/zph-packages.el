;;; zph-packages.el --- Auto-install packages
;; auto-install packages
;;; Code:
(dolist (package '(
         evil
         evil-leader
         evil-numbers
         evil-nerd-commenter
         surround
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
         fasd
         grizzl
         ))
  (unless (package-installed-p package)
    (package-install package)))
(provide 'zph-packages)
;;; zph-packages.el ends here

;;; zph-packages.el --- Auto-install packages
;; auto-install packages
;;; Code:
(dolist (package '(
         use-package
         ))
  (unless (package-installed-p package)
    (package-install package)))


(provide 'zph-packages)
;;; zph-packages.el ends here

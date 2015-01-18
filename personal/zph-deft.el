;;; zph-deft.el --- Clj configs

;;; Commentary:
;; 

;;; Code:

(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-directory "~/Dropbox/org_mode")
(setq deft-use-filename-as-title t)
;;(global-set-key "\C-x\C-d" 'deft)
(global-set-key [f7] 'deft)

(provide 'zph-deft)

;;; zph-deft.el ends here

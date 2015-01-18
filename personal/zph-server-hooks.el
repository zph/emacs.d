;;; zph-server-hooks.el --- Start emacs server


;;; Commentary:
;; 

;;; Code:

(add-hook 'server-visit-hook 'make-frame)
(add-hook 'server-switch-hook
          '(lambda ()
             (server-switch-buffer (other-buffer))))
(server-start)
(provide 'zph-server-hooks)

;;; zph-server-hooks.el ends here

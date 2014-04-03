;;; zph-evil-config.el --- e(VIM) evil-mode configs

;;; Commentary:
;;

(require 'undo-tree)
(require 'evil-autoloads)
(require 'evil-numbers)
;;; Code:

(setq evil-find-skip-newlines t
      evil-move-cursor-back nil
      evil-cross-lines t)
(setq evil-previous-state-alist '())
(setq evil-default-cursor #'cofi/evil-cursor)
(setq evil-leader/leader ","
      evil-leader/in-all-states t)
(require 'surround)
  (global-surround-mode 1)

(provide 'zph-evil-config)

;;; zph-evil-config.el ends here

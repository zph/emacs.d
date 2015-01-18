;;; zph-evil-config.el --- e(VIM) evil-mode configs

;;; Commentary:
;;

(require 'undo-tree)
(require 'evil-autoloads)
(require 'evil-numbers)
(require 'evil-leader)
;;; Code:
(setq evil-find-skip-newlines t
      evil-move-cursor-back nil
      evil-cross-lines t)
(setq evil-previous-state-alist '())
;;(setq evil-default-cursor #'cofi/evil-cursor)
(setq evil-leader/leader ","
      evil-leader/in-all-states t)
(require 'surround)
  (global-surround-mode 1)

;; Keymaps
(define-key evil-normal-state-map (kbd ",f") 'projectile-find-file)
(define-key evil-normal-state-map (kbd ",,") 'evil-buffer)
(define-key evil-normal-state-map (kbd ",e") 'emmet-expand-line)
;;Exit insert mode by pressing j and then j quickly
;; (setq key-chord-two-keys-delay 0.2)
;; (key-chord-define-global "jj" nil)
;; (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
;; (key-chord-mode 1)

;; evil-nerd-commenter
;;(setq evilnc-hotkey-comment-operator "\\\\")
;;(require 'evil-nerd-commenter)
;;(evilnc-default-hotkeys)
(provide 'zph-evil-config)

;;; zph-evil-config.el ends here

;;; zph-term-config.el --- Configurations for Term
(when (require 'multi-term nil t)
  (global-set-key (kbd "<f5>") 'multi-term)
  (global-set-key (kbd "<C-next>") 'multi-term-next)
  (global-set-key (kbd "<C-prior>") 'multi-term-prev)
  (global-set-key (kbd "C-c t") 'multi-term-next)
  (global-set-key (kbd "C-c T") 'multi-term) ;; create a new one
  (setq multi-term-buffer-name "term"
        multi-term-program "/bin/zsh"))
(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook
          (lambda ()
            (compilation-shell-minor-mode 1)
            (show-paren-mode -1)
            (tooltip-mode -1)
            (setq yas-dont-activate t)
            (setq show-trailing-whitespace nil)
            (add-to-list 'term-bind-key-alist '("M-[" . multi-term-prev))
            (add-to-list 'term-bind-key-alist '("M-]" . multi-term-next))
            (add-to-list 'term-bind-key-alist '("C-z" . term-send-raw))
            (setq term-buffer-maximum-size 50000)
            (define-key term-raw-map (kbd "C-y") 'term-paste)))

(defun terminal-init-screen ()
  "Terminal initialization function for screen."
  ;; Use the xterm color initialization code.
  (xterm-register-default-colors)
  (tty-set-up-initial-frame-faces))

(add-hook 'term-mode-hook 'evil-emacs-state)
(provide 'zph-term-config)
;;; zph-term-config.el ends here

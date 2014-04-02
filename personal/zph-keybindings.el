;;; zph-keybindings.el --- Keybindings

;;; Commentary:
;; 

(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "M-p") 'shell-command)
(global-set-key (kbd "<f12>") 'whitespace-mode)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(define-key global-map (kbd "C-c c") 'org-capture)
(global-set-key (kbd "<f8>") 're-builder) ; helps with building regexes

(provide 'zph-keybindings)

;;; zph-keybindings.el ends here

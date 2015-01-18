;;; zph-erc-config.el --- ERC configs

;;; Commentary:
;; 

;;; Code:

(defun erc-start ()
    (interactive) 
    (setq erc-echo-notices-in-minibuffer-flag t)
    (require 'erc)

    ;; require erc-match
    (require 'erc-match)
    (setq erc-keywords '("resolve" "mbuf"))
    (setq erc-current-nick-highlight-type 'nick)
    (setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
    (setq erc-track-use-faces t)
    (setq erc-track-faces-priority-list
         '(erc-current-nick-face erc-keyword-face)) (setq erc-track-priority-faces-only 'all)

    ;; erc scroll to bottom
    (setq erc-input-line-position -2)
    (setq erc-echo-notices-in-minibuffer-flag t)

    ;; Connect 
    (setq erc-autojoin-channels-alist 
         '(("freenode.net" "##lonelyhackersclub #rubydcamp")))
    (erc :server "irc.freenode.net" :nick "zph" :full-name "Zander" :password irc-password)
)

(provide 'zph-erc-config)

;;; zph-erc-config.el ends here

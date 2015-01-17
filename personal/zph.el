;;; zph.el --- zph bootstrapping

(setq frame-title-format "%b")		; use buffer name for title
(setq display-buffer-reuse-frames t)    ; no new frame if already open
;; use this shell alias for emacs to run emacsclient unless emacs not running, then run server
;;(load-theme 'base16-railscasts t)
(load-theme 'sanityinc-tomorrow-bright t)
(global-hl-line-mode -1)
(setq tab-width 2)

(defmacro global-defkey (key def)
    "*Bind KEY globally to DEF.
KEY should be a string in the format used for saving keyboard
  macros (cf.  `insert-kbd-macro')."
    `(global-set-key (read-kbd-macro ,key) ,def))
(icy-mode 1)
(setq prelude-whitespace nil)
;; Setting rbenv path

;;; Commentary:
;; 

(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(require 'ob-sml nil 'noerror)
(whitespace-mode -1)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook (lambda () (
  ;;(global-set-key (kbd "\C-c \'") 'org-edit-src-code)
)))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

;;(setq org-capture-templates
;;      ; '(("Incoming" ?i "** %t: %?\n  %i\n  %a"  "Uncategorized")))
;;  '(
;;    ("n" "Notes" entry (file+datetree "~/Dropbox/org_mode/incoming.org")
;;    "* %^{Description} %^g %?
;;    Added: %U")
;;    ("t" "Todo" entry (file+headline (concat org-directory "/incoming.org") "Tasks")
;;       "* TODO %?\n %i\n")
;;    ("l" "Link" plain (file (concat org-directory "/incoming.org"))
;;       "- %?\n %x\n")
;;  )
;;)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; This will transform ansi color to faces in Emacs shell!
(ansi-color-for-comint-mode-on)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))
(add-hook 'eshell-mode-hook
          '(lambda ()
             (add-to-list
              'eshell-output-filter-functions
              'eshell-handle-ansi-color)))
(org-babel-do-load-languages
 'org-babel-load-languages
 '( (perl . t)
    (ruby . t)
    (sh . t)
    (python . t)
    (emacs-lisp . t)
    ))
(setq org-confirm-babel-evaluate nil)

(set-face-attribute 'default nil :font "Source Code Pro-13")

;;(match-string "(dev)" "rr,stuff_dev_t,more")
(yas-global-mode 1)

;; fix some org-mode + yasnippet conflicts:
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (org-babel-do-load-languages
             'org-babel-load-languages
             '( (perl . t)
                (ruby . t)
                (sh . t)
                (python . t)
                (emacs-lisp . t)
                ))
            (setq org-confirm-babel-evaluate nil)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

(key-chord-mode -1)
(require 'evil)
  (evil-mode 1)
(provide 'zph)

;;; zph.el ends here

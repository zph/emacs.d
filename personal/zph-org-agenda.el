;;; package zph-org-agenda
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done nil)
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)

(autoload 'remember "remember" nil t)
(autoload 'remember-region "remember" nil t)

(setq org-directory "~/Dropbox/org_mode/")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org_mode/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-files (file-expand-wildcards "~/Dropbox/org_mode/*.org"))

(setq org-default-notes-file "~/.notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

(define-key global-map [f8] 'remember)
(define-key global-map [f9] 'remember-region)

(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)")))
;;TODO(t) MAYBE(m) WAITING(w) APPT(a) | DONE(d) CANCELLED(c) DEFERRED(f)

(setq org-use-fast-todo-selection t)

(setq org-agenda-custom-commands
'(

("P" "Projects"   
((tags "PROJECT")))

("H" "Office and Home Lists"
     ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "DVD")
          (tags-todo "READING")))

("D" "Daily Action List"
     (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
)
)

(defun gtd ()
    (interactive)
    (find-file "c:/charles/gtd/newgtd.org")
)
(global-set-key (kbd "C-c g") 'gtd)


(add-hook 'org-agenda-mode-hook 'hl-line-mode)

(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)
(setq org-agenda-files (list "~/Dropbox/org_mode/agenda.org"))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/org_mode/incoming.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Dropbox/org_mode/incoming.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Dropbox/org_mode/incoming.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ;;("j" "Journal" entry (file+datetree "~/git/org/diary.org")
              ;; "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Dropbox/org_mode/incoming.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Dropbox/org_mode/incoming.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Dropbox/org_mode/incoming.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Dropbox/org_mode/incoming.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;;; Credit: @dysinger and http://www.xradiograph.com/Emacs/OrgMode
;;; per http://orgmode.org/manual/Closing-items.html
(setq org-log-done 'time)
;; (setq org-log-done 'note)
;;(add-hook 'org-todo 'mrb/insert-created-timestamp)
;;; Credit: http://doc.norang.ca/org-mode.html#InsertInactiveTimestamps
(defvar bh/insert-inactive-timestamp t)

(defun bh/toggle-insert-inactive-timestamp ()
  (interactive)
  (setq bh/insert-inactive-timestamp (not bh/insert-inactive-timestamp))
  (message "Heading timestamps are %s" (if bh/insert-inactive-timestamp "ON" "OFF")))

(defun bh/insert-inactive-timestamp ()
  (interactive)
  (org-insert-time-stamp nil t t nil nil nil))

(defun bh/insert-heading-inactive-timestamp ()
  (save-excursion
    (when bh/insert-inactive-timestamp
      (org-return)
      (org-cycle)
      (bh/insert-inactive-timestamp))))

;;(add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp 'append)


;; TODO: HACK, clean up code & remove duplication
(add-hook 'org-insert-heading-hook 'mrb/insert-created-timestamp 'append)

(provide 'zph-org-agenda)
;;; zph-org-agenda ends here

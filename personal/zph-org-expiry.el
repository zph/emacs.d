;;; zph-org-expiry SUMMARY
;;
;; CREDIT: @mrb - https://gist.githubusercontent.com/mrvdb/4037694/raw/3970085b0b41c3d605e8ea28d27b7ac430040f1d/org-mode.el
;; Allow automatically handing of created/expired meta data.
;;
(require 'org-expiry)
;; Configure it a bit to my liking
(setq
  org-expiry-created-property-name "CREATED" ; Name of property when an item is created
  org-expiry-inactive-timestamps   t         ; Don't have everything in the agenda view
)

(defun mrb/insert-created-timestamp()
  "Insert a CREATED property using org-expiry.el for TODO entries"
  (interactive)
  (org-expiry-insert-created)
  (org-back-to-heading)
  (org-end-of-line)
  (insert " ")
)
  
;; Whenever a TODO entry is created, I want a timestamp
;; Advice org-insert-todo-heading to insert a created timestamp using org-expiry
(defadvice org-insert-todo-heading (after mrb/created-timestamp-advice activate)
  "Insert a CREATED property using org-expiry.el for TODO entries"
  (mrb/insert-created-timestamp)
)
;; Make it active
(ad-activate 'org-insert-todo-heading)

(require 'org-capture)

(defadvice org-capture (after mrb/created-timestamp-advice activate)
  "Insert a CREATED property using org-expiry.el for TODO entries"
  ; Test if the captured entry is a TODO, if so insert the created
  ; timestamp property, otherwise ignore
  (when (member (org-get-todo-state) org-todo-keywords-1)
    (mrb/insert-created-timestamp)))
(ad-activate 'org-capture)

;; Add feature to allow easy adding of tags in a capture window
(defun mrb/add-tags-in-capture()
  (interactive)
  "Insert tags in a capture window without losing the point"
  (save-excursion
    (org-back-to-heading)
    (org-set-tags)))
;; Bind this to a reasonable key
(define-key org-capture-mode-map "\C-c\C-t" 'mrb/add-tags-in-capture)

(provide 'zph-org-expiry)
;;; zph-org-expiry ends here

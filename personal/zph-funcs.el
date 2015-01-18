;;; zph-funcs.el --- Misc functions


;;; Commentary:
;; 

;;; Code:

(defun open-file-at-cursor ()
  "Open the file path under cursor.
If there is text selection, uses the text selection for path.
If the path is starts with “http://”, open the URL in browser.
Input path can be {relative, full path, URL}.
This command is similar to `find-file-at-point' but without prompting for confirmation."
  (interactive)
  (let ( (path (thing-at-point 'filename)))
    (if (string-match-p "\\`https*://" path)
        (progn (browse-url path))
      (progn ; not starting “http://”
        (if (file-exists-p path)
            (progn (find-file path))
          (if (file-exists-p (concat path ".el"))
              (progn (find-file (concat path ".el")))
            (progn
              (when (y-or-n-p (format "File doesn't exist: 「%s」.  Create? " path) )
                (progn (find-file path ))) ) ) ) ) ) ))
(defun reload-emacs-config ()
    "reload your .emacs file without restarting Emacs"
    ;; Source: comment at http://www.saltycrane.com/blog/2007/07/how-to-reload-your-emacs-file-while/
    (interactive)
    (load-file "~/.emacs.d/init.el") )

(defun zph/comment-or-uncomment-region-or-line ()
  ;; Credit: @Gerstmann http://stackoverflow.com/a/9697222/1930671
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(provide 'zph-funcs)

;;; zph-funcs.el ends here

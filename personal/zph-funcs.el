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
(provide 'zph-funcs)

;;; zph-funcs.el ends here

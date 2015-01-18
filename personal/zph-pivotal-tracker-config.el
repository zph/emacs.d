;;; zph-pivotal-tracker-config.el --- Configs

;;; Commentary:

(defun pivotal-open-story-on-web ()
  "Opens a Pivotal Story on the web when executed on a Story #"
  (interactive)
  ;(sample "45870133")
  (let (link-name)
    (setq link-name (thing-at-point 'word))
    (shell-command (concat "open https://www.pivotaltracker.com/story/show/" link-name))))
     ;(shell-command (concat "open x-devonthink-item:" record-location))
(global-set-key "\C-c\C-p" 'pivotal-open-story-on-web)
;;(load "~/src/pivotal-tracker/pivotal-tracker")
(provide 'zph-pivotal-tracker-config)
;;; zph-pivotal-tracker-config.el ends here


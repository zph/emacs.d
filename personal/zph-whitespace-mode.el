;;; zph-whitespace-mode.el --- Whitespace settings


;;; Commentary:
;;

;;; Code:
;; highlight tabs and trailing whitespace
;; Credit: http://vincesalvino.blogspot.com/2013/07/tabs-whitespaces-and-highlighting-in.html
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)
(provide 'zph-whitespace-mode)

;;; zph-whitespace-mode.el ends here

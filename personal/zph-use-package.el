;;; zph-use-package.el

(require 'use-package)

(dolist (package '(
                   clojure-mode
                   creole-mode
                   fasd
                   fastnav
                   ghc
                   grizzl
                   isend-mode
                   magit
                   ob-tangle
                   org-expiry
                   org-install
                   pinboard
                   pretty-mode
                   projectile
                   remember
                   ruby-refactor
                   ruby-refactoring
                   smex
                   undo-tree
                   web
                   window-number
                   yasnippet
                   ))
  (use-package package
               :ensure t
               :defer t))

(dolist (package '(
                   evil
                   evil-leader
                   evil-numbers
                   evil-nerd-commenter
                   surround
                   icicles
                   expand-region
                   zph
                   zph-authentication
                   zph-clojure
                   zph-erc-config
                   zph-evil-config
                   zph-funcs
                   zph-haskell
                   zph-ido
                   zph-keybindings
                   zph-osx
                   zph-pivotal-tracker-config
                   zph-server-hooks
                   zph-term-config
                   zph-deft
                   zph-org-agenda
                   zph-org-expiry
                   pivotal-tracker
                   ))
  (use-package package
               :ensure t))

(provide 'zph-use-package)
;;; end of zph-use-package

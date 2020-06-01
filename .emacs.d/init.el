(show-paren-mode t)
(global-linum-mode t)
(setq linum-format "%4d ")
(load-theme 'tango-dark)
(setq-default indent-tabs-mode nil)

(setq mode-line-position
      '((-3 "%p")
        (size-indication-mode (8 " of %I"))
        (line-number-mode
         ((column-number-mode (10 " L%l C%c") (6 " L%l")))
         ((column-number-mode (5 " C%c"))))))

(column-number-mode)

(setq read-file-name-completion-ignore-case nil)

(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-offset 'arglist-intro '++)
             (c-set-offset 'arglist-cont 0)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'inlambda 0)
             ))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-indent-level 4)))

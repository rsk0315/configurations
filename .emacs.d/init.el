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

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)
;; (package-initialize)
;; (package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(string-inflection ddskk haskell-mode yaml-mode markdown-mode rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'rust-mode)
(setq rust-format-on-save t)

;; (use-package markdown-mode
;;              :ensure t
;;              :commands (markdown-mode gfm-mode)
;;              :mode (("README\\.md\\'" . gfm-mode)
;;                     ("\\.md\\'" . markdown-mode)
;;                     ("\\.markdown\\'" . markdown-mode))
;;              :init (setq markdown-command "multimarkdown"))

(setq load-path (append '("~/.emacs.d/elisp") load-path))

(require 'satysfi)
(require 'satysfi-mode)

(add-to-list 'auto-mode-alist '("\\.\\(saty\\|satyh\\)$" . satysfi-mode))
(autoload 'satysfi-mode "satysfi-mode" "Major mode for editing SATySFi document." t)

;; (global-set-key (kbd "C-x C-j") 'skk-mode)
;; (setq skk-tut-file "~/git/skk-dev/ddskk/etc/SKK.tut")

;; https://stackoverflow.com/questions/9288181/converting-from-camelcase-to-in-emacs
(global-set-key (kbd "C-c C") 'string-inflection-camelcase)       ;; UpperCamelCase
(global-set-key (kbd "C-c c") 'string-inflection-lower-camelcase) ;; lowerCamelCase
(global-set-key (kbd "C-c -") 'string-inflection-kebab-case)      ;; kebab-case
(global-set-key (kbd "C-c _") 'string-inflection-underscore)      ;; snake_case
(global-set-key (kbd "C-c =") 'string-inflection-upcase)          ;; SCREAMING_SNAKE_CASE

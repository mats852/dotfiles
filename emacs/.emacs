;====================
; SETTINGS
;====================

(global-visual-line-mode t)            ; No linewrap


;====================
; THEMES
;====================

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/one-dark")

; Load theme
(load-theme 'atom-one-dark t)


;====================
; PLUGINS
;====================

; Evil mode
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Neotree
(add-to-list 'load-path "~/.emacs.d/plugins/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;====================
; Syntax
;====================

(add-to-list 'load-path "~/.emacs.d/syntax/elisp/twig-mode")
(require 'twig-mode)


;====================
; Key bindings
;====================

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

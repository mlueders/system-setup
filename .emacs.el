; 3/11/11
; http://www.gnu.org/software/emacs/emacs-lisp-intro/

; turn tabs to spaces
(setq-default indent-tabs-mode nil)

; copy/paste to/from clipboard
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

; 3/11/11
; http://www.gnu.org/software/emacs/emacs-lisp-intro/

; turn tabs to spaces
(setq-default indent-tabs-mode nil)

; copy/paste to/from clipboard
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

; rebind list-buffers to buffer-menu
(global-set-key "\C-x\C-b" 'buffer-menu)

; don't display startup screen
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; word wrap
(global-visual-line-mode t)

; remove the annoying scratch buffer message
(setq initial-scratch-message "")

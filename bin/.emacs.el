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

; enable word wrap
(setq word-wrap t)

; remove the annoying scratch buffer message
(setq initial-scratch-message "")

(setq ruby-indent-level 4)

; save multiple backups in central location
(setq backup-directory-alist `(("." . "~/.emacs.d/backup")))
(setq version-control t ;; Use version numbers for backups.
        kept-new-versions 3 ;; Number of newest versions to keep.
        kept-old-versions 0 ;; Number of oldest versions to keep.
        delete-old-versions t ;; Don't ask to delete excess backup versions.
        backup-by-copying t) ;; Copy all files, don't rename them.
(defun force-backup-of-buffer ()
    ;; Make a special "per session" backup at the first save of each
    ;; emacs session.
    (when (not buffer-backed-up)
      ;; Override the default parameters for per-session backups.
      (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
            (kept-new-versions 3))
        (backup-buffer)))
    ;; Make a "per save" backup on each save.  The first save results in
    ;; both a per-session and a per-save backup, to keep the numbering
    ;; of per-save backups consistent.
    (let ((buffer-backed-up nil))
      (backup-buffer)))
(add-hook 'before-save-hook  'force-backup-of-buffer)


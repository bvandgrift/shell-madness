(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(setq mac-function-modifier 'super)

(global-set-key [(hyper f1)] (lambda () (interactive) (shell "*shell-1*")))
(global-set-key [(hyper f2)] (lambda () (interactive) (shell "*shell-2*")))
(global-set-key [(hyper f3)] (lambda () (interactive) (shell "*shell-3*")))
(global-set-key [(hyper f4)] (lambda () (interactive) (shell "*shell-4*")))
(global-set-key [(hyper f5)] (lambda () (interactive) (shell "*shell-5*")))
(global-set-key [(hyper f6)] (lambda () (interactive) (shell "*shell-6*")))
(global-set-key [(hyper f7)] (lambda () (interactive) (shell "*shell-7*")))
(global-set-key [(hyper meta s)] 'save-some-buffers)
(global-set-key [(hyper meta l)] 'longlines-mode)
(global-set-key [(hyper b)] 'ido-switch-buffer)
(global-set-key [(control G)] 'magit-status)
(global-set-key [(meta s)] 'shell)
(global-set-key [(hyper /)] 'comment-or-uncomment-region)
(global-set-key [(hyper k)] (lambda () (interactive) (recenter 0)))
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper t)] 'find-file-in-project)
(global-set-key [(hyper T)] 'find-tag)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper u)] (lambda () (interactive) (recenter 0)))
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper r)] 'query-replace-regexp)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper f)] '(lambda (re) (interactive "sFind-grep (grep regexp): ") (find-grep-dired (project-root-or-default-dir) re)))
(global-set-key [(hyper meta f)] 'find-grep-dired)
(global-set-key [(hyper g)] 'grep-find)
(global-set-key [(hyper w)] 'kill-buffer)
(global-set-key [(hyper \])] 'indent-rigidly)
(global-set-key [(hyper \[)] (lambda (start end arg) (interactive "r\np") (indent-rigidly start end (- arg))))
(global-set-key [(hyper right)] 'other-window)
(global-set-key [(hyper left)] 'other-window-backwards)
(global-set-key [(hyper z)] 'undo)
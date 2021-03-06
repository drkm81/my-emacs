;; Place your bindings here.

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)


;; Add more natural <up> and <down> key bindings for shell mode
(defun my-shell-mode-keys ()
  "Modify keymaps used by repl."
  (local-set-key (kbd "<up>")   'comint-previous-input)
  (local-set-key (kbd "<down>") 'comint-next-input)
  )

(add-hook 'shell-mode-hook 'my-shell-mode-keys)


;; Add more natural <up> and <down> key bindings for nrepl mode
(defun my-nrepl-mode-keys ()
  "Modify keymaps used by repl."
  (local-set-key (kbd "<up>")   'nrepl-previous-input)
  (local-set-key (kbd "<down>") 'nrepl-next-input)
  )

(add-hook 'nrepl-mode-hook 'my-nrepl-mode-keys)


;; Add more natural <up> and <down> key bindings for nrepl mode
(defun my-cider-mode-keys ()
  "Modify keymaps used by repl."
  (local-set-key (kbd "<up>")   'cider-repl-previous-input)
  (local-set-key (kbd "<down>") 'cider-repl-next-input)
  (local-set-key (kbd "C-c C-.") 'cider-macroexpand-1)
  )

(add-hook 'cider-repl-mode-hook 'my-cider-mode-keys)


;; json pretty-print
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))


;; add major mode key binding for JSON pretty print
(defun my-json-mode-keys ()
  "Modify keymaps used by the editor."
  (local-set-key (kbd "C-M-\\")   'json-format)
  )

(add-hook 'js-mode-hook 'my-json-mode-keys)
(add-hook 'js2-mode-hook 'my-json-mode-keys)


;;
;; Clojure mode font-locking for partial
;;
(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(partial\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "Ƥ")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(comp\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "⨌")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(and\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "⋏")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(or\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "⋎")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(for\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∀")
                               nil))))))

(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(reduce\\)[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "∑")
                               nil))))))

;;
;; Expand region is too cool to not to use it
;;
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

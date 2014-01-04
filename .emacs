(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'load-path "~/.emacs.d/lisp/jade-mode")

(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(require 'edje-mode)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(setq js2-mode-hook
  '(lambda () (progn
    (set-variable 'indent-tabs-mode nil))))

;; (autoload 'guess-style-set-variable "guess-style" nil t)
;; (autoload 'guess-style-guess-variable "guess-style")
;; (autoload 'guess-style-guess-all "guess-style" nil t)
;; (add-hook 'c-mode-common-hook 'guess-style-guess-all)

(setq backup-directory-alist `(("." . "~/.saves")))

(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)

(require 'column-marker)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-1 80)))

(column-number-mode 1)
(line-number-mode 1)
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)
(setq compilation-disable-input nil)
(setq compilation-scroll-output t)
(set-face-attribute 'default nil :height 100)

(set-background-color "white")

;; Scroll only line by line
(setq scroll-step 1
      scroll-conservatively  10000)

;; Turn on semantic
(setq semantic-load-turn-everything-on t)
;; (require 'semantic-load)

(load "mmm-mako.el")
;Then specify the extensions to use with mmm-mako mode:
(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

;; Create my personal style.
(defconst uvc-c-style
  '((c-basic-offet              . 2)
    (c-tab-always-indent        . t)
    (indent-tabs-mode           . nil)
    (c-offsets-alist . ((func-decl-cont . ++)
                        (member-init-intro . ++)
                        (inher-intro . ++)
                        (comment-intro . 0)
                        (arglist-close . c-lineup-arglist)
                        (topmost-intro . 0)
                        (block-open . 0)
                        (inline-open . 0)
                        (substatement-open . 0)
                        (label . /)
                        (case-label . 0)
                        (statement-case-open . +)
                        (statement-case-intro . +) ; case w/o {
                        (access-label . /)
                        (innamespace . 0))))
  "UVC C Programming Style")

(c-add-style "UVC" uvc-c-style)
(setq c-default-style "uvc")

;; ;; Customizations for all modes in CC Mode.
;; (defun my-c-mode-common-hook ()
;;   ;; set my personal style for the current buffer
;;   (c-set-style "PERSONAL")
;;   ;; other customizations
;;   (setq tab-width 8
;;         ;; this will make sure spaces are used instead of tabs
;;         indent-tabs-mode nil)
;;   ;; we like auto-newline, but not hungry-delete
;;   (c-toggle-auto-newline 1))
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



;; ECB setup
(setq ecb-version-check nil)
(setq ecb-tip-of-the-day nil)
(setq inhibit-splash-screen t)
(setq ecb-show-sources-in-directories-buffer '("leftright-custom2"))
(setq ecb-layout-name "leftright-custom2")
(setq ecb-windows-width 30)
(ecb-activate)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("leftright-custom2" (ecb-directories-buffer-name 0.19491525423728814 . 0.9841269841269841) (ecb-methods-buffer-name 0.18220338983050846 . 0.49206349206349204) (ecb-history-buffer-name 0.18220338983050846 . 0.49206349206349204)) ("leftright-custom" (ecb-directories-buffer-name 0.19915254237288135 . 0.9841269841269841) (ecb-methods-buffer-name 0.1864406779661017 . 0.49206349206349204) (ecb-history-buffer-name 0.1864406779661017 . 0.49206349206349204)))))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/home/mholtzberg/workspaces" "workspaces") ("/home/mholtzberg" "home")))))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(delete-selection-mode 1)
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "James Ah Yong"
      user-mail-address "james@ahyo.ng")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "ETbb" :height 1.3)
      doom-big-font (font-spec :family "JetBrains Mono" :size 24))
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(use-package! mixed-pitch
  :defer t
  :config
  (setq mixed-pitch-variable-pitch-cursor nil)
  (setq mixed-pitch-set-height t)
  (set-face-attribute 'variable-pitch nil :height 1.3)
  :hook
  (text-mode . mixed-pitch-mode))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq doom-leader-key "SPC"
      doom-localleader-key ",")

(map! :leader
      "|" #'evil-window-split
      "-" #'evil-window-split)

;; Function that tries to autoexpand YaSnippets
;; The double quoting is NOT a typo!
(defun my/yas-try-expanding-auto-snippets ()
  (when (bound-and-true-p yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand))))

;; Try after every insertion
(add-hook 'post-self-insert-hook #'my/yas-try-expanding-auto-snippets)

(use-package! cdlatex
  :defer
  :hook (LaTeX-mode . cdlatex-mode)
  :hook (org-mode . org-cdlatex-mode)
  :config
  (setq cdlatex-math-symbol nil)
  (map! :map org-cdlatex-mode-map
        "`" nil
        "'" nil)
  (map! :map cdlatex-mode-map
        "`" nil
        "'" nil))

(use-package! laas
  :defer
  :hook (LaTeX-mode . laas-mode)
  :config
  (setq laas-enable-auto-space nil)
  (setq laas-basic-snippets
        '(:cond laas-mathp
          "!="    "\\neq"
          "!>"    "\\mapsto"
          "**"    "\\cdot"
          "+-"    "\\pm"
          "-+"    "\\mp"
          "->"    "\\to"
          "..."   "\\dots"
          "<<"    "\\ll"
          "<="    "\\leq"
          "<>"    "\\diamond"
          "=<"    "\\impliedby"
          "=="    "&="
          "=>"    "\\implies"
          ">="    "\\geq"
          ">>"    "\\gg"
          "AA"    "\\forall"
          "EE"    "\\exists"
          "cb"    "^3"
          "iff"   "\\iff"
          "inn"   "\\in"
          "notin" "\\not\\in"
          "sr"    "^2"
          "xx"    "\\times"
          "|->"   "\\mapsto"
          "|="    "\\models"
          "||"    "\\mid"
          "~="    "\\approx"
          "~~"    "\\sim"
          ";a"  "\\alpha"
          ";A"  "\\forall"        ";;A" "\\aleph"
          ";b"  "\\beta"
          ";;;c" "\\cos"
          ";;;C" "\\arccos"
          ";d"  "\\delta"         ";;d" "\\partial"
          ";D"  "\\Delta"         ";;D" "\\nabla"
          ";e"  "\\epsilon"       ";;e" "\\varepsilon"   ";;;e" "\\exp"
          ";E"  "\\exists"                               ";;;E" "\\ln"
          ";f"  "\\phi"           ";;f" "\\varphi"
          ";F"  "\\Phi"
          ";g"  "\\gamma"                                ";;;g" "\\lg"
          ";G"  "\\Gamma"                                ";;;G" "10^{?}"
          ";h"  "\\eta"           ";;h" "\\hbar"
          ";i"  "\\in"            ";;i" "\\imath"
          ";I"  "\\iota"          ";;I" "\\Im"
          ";;j" "\\jmath"
          ";k"  "\\kappa"
          ";l"  "\\lambda"        ";;l" "\\ell"          ";;;l" "\\log"
          ";L"  "\\Lambda"
          ";m"  "\\mu"
          ";n"  "\\nu"                                   ";;;n" "\\ln"
          ";N"  "\\nabla"                                ";;;N" "\\exp"
          ";o"  "\\omega"
          ";O"  "\\Omega"         ";;O" "\\mho"
          ";p"  "\\pi"            ";;p" "\\varpi"
          ";P"  "\\Pi"
          ";q"  "\\theta"         ";;q" "\\vartheta"
          ";Q"  "\\Theta"
          ";r"  "\\rho"           ";;r" "\\varrho"
          ";;R" "\\Re"
          ";s"  "\\sigma"         ";;s" "\\varsigma"    ";;;s" "\\sin"
          ";S"  "\\Sigma"                               ";;;S" "\\arcsin"
          ";t"  "\\tau"                                 ";;;t" "\\tan"
          ";;;T" "\\arctan"
          ";u"  "\\upsilon"
          ";U"  "\\Upsilon"
          ";v"  "\\vee"
          ";V"  "\\Phi"
          ";w"  "\\xi"
          ";W"  "\\Xi"
          ";x"  "\\chi"
          ";y"  "\\psi"
          ";Y"  "\\Psi"
          ";z"  "\\zeta"
          ";0"  "\\emptyset"
          ";8"  "\\infty"
          ";!"  "\\neg"
          ";^"  "\\uparrow"
          ";&"  "\\wedge"
          ";~"  "\\approx"        ";;~" "\\simeq"
          ";_"  "\\downarrow"
          ";+"  "\\cup"           ";;+" "\\oplus"
          ";-"  "\\leftrightarrow"";;-" "\\longleftrightarrow"
          ";*"  "\\times"
          ";/"  "\\not"
          ";|"  "\\mapsto"        ";;|" "\\longmapsto"
          ";\\" "\\setminus"
          ";="  "\\Leftrightarrow"";;=" "\\Longleftrightarrow"
          ";(" "\\langle"
          ";)" "\\rangle"
          ";[" "\\Leftarrow"     ";;[" "\\Longleftarrow"
          ";]" "\\Rightarrow"    ";;]" "\\Longrightarrow"
          ";{"  "\\subset"
          ";}"  "\\supset"
          ";<"  "\\leftarrow"    ";;<" "\\longleftarrow"  ";;;<" "\\min"
          ";>"  "\\rightarrow"   ";;>" "\\longrightarrow" ";;;>" "\\max"
          ";'"  "\\prime"
          ";."  "\\cdot"
          )))

;;(KEY TEMPLATE NAME CONDITION GROUP EXPAND-ENV LOAD-FILE KEYBINDING UUID SAVE-FILE)
(after! yasnippet
  (yas-define-snippets 'latex-mode '(
    ("dm"
     "\\[\n`(save-excursion (previous-line)(make-string (current-indentation) ?\s))`$0\n\\]"
     "display math"
     (and (not (texmathp)) 'auto))
    ("sr" "^2$0" "squared" (and texmathp 'auto))
    ("cb" "^3$0" "cubed" (and texmathp 'auto))
    )))

(after! org
  (custom-set-faces!
    '(org-document-title :height 1.3)
    '(org-level-1 :inherit outline-1 :weight extra-bold :height 1.4)
    '(org-level-2 :inherit outline-2 :weight bold :height 1.15)
    '(org-level-3 :inherit outline-3 :weight bold :height 1.12)
    '(org-level-4 :inherit outline-4 :weight bold :height 1.09)
    '(org-level-5 :inherit outline-5 :weight semi-bold :height 1.06)
    '(org-level-6 :inherit outline-6 :weight semi-bold :height 1.03)
    '(org-level-7 :inherit outline-7 :weight semi-bold)
    '(org-level-8 :inherit outline-8 :weight semi-bold)))

(after! org (setq org-hide-emphasis-markers t))
(use-package! org-appear
  :hook (org-mode . org-appear-mode))

(after! org
  (setq org-use-speed-commands
        (lambda ()
          (and (looking-at org-outline-regexp)
               (looking-back "^\**")))))

(after! yasnippet
  (yas-define-snippets 'org-mode '(
    ("<el" "#+begin_src emacs-lisp\n$1\n#+end_src$0" "src emacs-lisp")
    ("<elt" "#+begin_src emacs-lisp :tangle $1\n$2\n#+end_src$0" "src emacs-lisp tangle")
    ("<sh" "#+begin_src sh\n$1\n#+end_src$0" "src sh")
    ("<sht" "#+begin_src sh :tangle $1\n$2\n#+end_src$0" "src sh tangle")
    )))
(after! org
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp")))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

;; an-old-hope-theme.el -- a syntax theme from a galaxy far away... -*- lexical-binding: t -*-
;; Author: MoHKale
;; URL: https://github.com/MoHKale/an-old-hope-theme
;; Version: 0.1.0
;; Keywords: color, theme
;; Package-Requires: ((emacs "24"))

;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;; Commentary:
;; see https://github.com/MoHKale/an-old-hope-theme/tree/master/emacs

;; [[file:~/.emacs.d/init.org::*Faces][Faces:1]]
(let ((desc (quote "emacs theme inspired by a galaxy far far away...
this theme is largely just a shot for shot copy of `jesseleite/an-old-hope-syntax-atom'
ported to emacs because I refuse to live with an IDE that doesn't look like it XD.
This theme isn't compatible with emacs in the terminal yet, when I find an easy way
to approximate true-color colors to non-true-color colors, then I'll add support for
it.
"))
      (colors (quote ((very-light-grey "#cbccd1") (light-grey "#848794") (grey "#686b78") (dark-grey "#44464f") (very-dark-grey "#1c1d20") (red "#ea3d54") (red-dim "#d45364") (red-int "#f43333") (orange "#ee7b29") (orange-dim "#d68e5b") (orange-int "#f29858") (yellow "#e5cc51") (yellow-dim "#897614") (yellow-int "#fedd38") (green "#78bd65") (green-dim "#86b270") (green-int "#5ac85a") (blue "#4fb3d8") (blue-dim "#64a3c3") (blue-int "#5689f0") (purple "#b978ab") (purple-dim "#ca9ac0") (purple-int "#c170b0") (turquoise "#67e4c4") (turquoise-dim "#c1efe4") (turquoise-int "#19e5b2") (black "#212125") (black-dim "#2d2d38") (black-int "#000000") (white "#ffffff") (line-highlight-bg "#313339") (extra-dark-grey "#17181b") (debug "#022d3f"))))
      (cls (quote t))
      (rainbow-delims (quote (("#E6B422") ("#C70067") ("#00A960") ("#FC7482") ("#E6B422") ("#C70067") ("#00A960") ("#FC7482")))))
(require 'dash)

(deftheme an-old-hope
  desc)

(dolist (color colors)
  (set (car color) (nth 1 color)))

(setq rainbow-delims (-flatten rainbow-delims))

(custom-theme-set-faces
 'an-old-hope

 ;;; basic
 `(cursor ((,cls (:background ,red))))
 `(custom-button ((,cls (:background ,very-dark-grey :foreground ,very-light-grey :box (:line-width 2 :style released-button)))))

 ;; sets the general foreground and background colors
 `(default ((,cls (:background ,very-dark-grey :foreground ,very-light-grey))))
 `(default-italic ((,cls (:italic t :inherit default))))
 `(hl-line ((,cls (:background ,line-highlight-bg)))) ; NOTE current line
 `(fringe ((,cls (:background ,black)))) ; NOTE: defines bars to the left and right, after line number when applicable
 `(vi-tilde-fringe-face ((,cls ((:inherit default)))))
 `(vertical-border ((,cls (:foreground ,very-light-grey)))) ; NOTE seperator between windows
 `(internal-border ((,cls (:foreground ,white :background ,white))))

 ;; errors, successes and warnings and other highlights
 `(error   ((,cls (:background ,red    :distant-foreground ,red    :foreground ,very-dark-grey :inherit bold))))
 `(success ((,cls (:background ,green  :distant-foreground ,green  :foreground ,very-dark-grey :inherit bold))))
 `(warning ((,cls (:background ,yellow :distant-foreground ,yellow :foreground ,very-dark-grey :inherit bold))))
 `(highlight ((,cls (:foreground ,very-dark-grey :background ,turquoise :distant-foreground ,turquoise :inherit bold))))
 `(region ((,cls (:background ,dark-grey :weight bold)))) ; NOTE visual mode selection
 `(secondary-selection ((,cls (:inherit region)))) ; TODO no idea what this is for, document it
 `(lazy-highlight ((,cls (:background ,orange :foreground ,black-dim)))) ; color for matches for in process searches
 `(isearch ((t (:inherit lazy-highlight :weight bold)))) ; NOTE inherited by evil-ex-search
 `(shadow ((,cls (:foreground ,light-grey)))) ; shadowed text, undermines actual text
 `(header-line ((,cls (:background ,very-dark-grey :foreground ,blue)))) ; shown at the top of some buffers, including in HEXL mode and helm
 `(match ((,cls (:foreground ,green-dim)))) ; TODO no idea what this is for, document it
 `(underline ((,cls (:inherit default)))) ;; needs to be set because compile uses it by force :(

 ;; line numbers
 `(line-number ((,cls (:background ,black :foreground ,very-light-grey :weight normal :underline nil))))
 `(line-number-current-line ((,cls (:foreground ,blue :inherit line-number))))

 ;; font locks and syntax highlighting
 `(font-lock-builtin-face ((,cls (:foreground ,blue))))
 `(font-lock-comment-face ((,cls (:foreground ,grey))))
 `(font-lock-keyword-face ((,cls (:foreground ,green))))
 `(font-lock-constant-face ((,cls (:foreground ,red :inherit bold))))
 `(font-lock-function-name-face ((,cls (:foreground ,yellow-int))))
 `(font-lock-negation-char-face ((,cls (:foreground ,red))))
 `(font-lock-preprocessor-face ((,cls (:foreground ,green-dim))))
 `(font-lock-string-face ((,cls (:foreground ,blue))))
 `(font-lock-doc-face ((,cls (:inherit font-lock-string-face)))) ; TODO optional bg
 `(font-lock-type-face ((,cls (:foreground ,red))))
 `(font-lock-warning-face ((,cls (:background ,yellow-int :distant-foreground ,yellow-int :foreground ,very-dark-grey :underline nil :inherit bold))))
 `(font-lock-variable-name-face ((,cls (:foreground ,yellow-int))))

 ;; rainbow delimeters are pretty
 `(rainbow-delimiters-depth-1-face ((,cls (:foreground ,(nth 0 rainbow-delims)))))
 `(rainbow-delimiters-depth-2-face ((,cls (:foreground ,(nth 1 rainbow-delims)))))
 `(rainbow-delimiters-depth-3-face ((,cls (:foreground ,(nth 2 rainbow-delims)))))
 `(rainbow-delimiters-depth-4-face ((,cls (:foreground ,(nth 3 rainbow-delims)))))
 `(rainbow-delimiters-depth-5-face ((,cls (:foreground ,(nth 4 rainbow-delims)))))
 `(rainbow-delimiters-depth-6-face ((,cls (:foreground ,(nth 5 rainbow-delims)))))
 `(rainbow-delimiters-depth-7-face ((,cls (:foreground ,(nth 6 rainbow-delims)))))
 `(rainbow-delimiters-depth-8-face ((,cls (:foreground ,(nth 7 rainbow-delims)))))

 ;; hyperlinks and path links
 `(link ((,cls (:foreground ,blue))))   ; hyperlink
 `(link-visited ((,cls (:foreground ,turquoise))))

 ;;; modeline/spaceline
 ;; NOTE mode-line faces below only affect some portions of the mode line
 ;;      these include the buffer name, the mode list & buffer percentage.
 `(mode-line ((,cls (:box (:line-width 1 :color ,very-light-grey :style none)
                          :background ,very-light-grey ; also winum color
                          :foreground ,very-dark-grey))))

 `(spaceline-evil-normal  ((,cls (:inherit mode-line :foreground ,very-dark-grey  :background "DarkGoldenrod2"))))
 `(spaceline-evil-insert  ((,cls (:inherit mode-line :foreground ,very-dark-grey  :background ,green-int))))
 `(spaceline-evil-emacs   ((,cls (:inherit mode-line :foreground ,very-dark-grey  :background ,blue))))
 `(spaceline-evil-replace ((,cls (:inherit mode-line :foreground ,very-dark-grey  :background ,turquoise-int))))
 `(spaceline-evil-visual  ((,cls (:inherit mode-line :foreground ,very-light-grey :background ,dark-grey))))
 `(spaceline-evil-motion  ((,cls (:inherit mode-line :foreground ,very-dark-grey  :background ,purple-int))))
 `(spaceline-minibuffer   ((,cls (:inherit mode-line :foreground ,very-dark-grey  :background ,blue))))

 ;; TODO configure mode-line-inactive as well
 ;; NOTE powerline-active-0 and powerline-inactive-0 also exist, but I have no idea what they do
 `(powerline-active1 ((,cls (:background ,black :foreground ,very-light-grey :inherit mode-line)))) ; major mode indicator
 `(powerline-active2 ((,cls (:background ,black :foreground ,very-light-grey :inherit mode-line)))) ; file-format + cursor-pos

 ;; custom segment themes
 `(spaceline-server-running-face ((,cls (:foreground ,green))))
 `(spaceline-server-starting-face ((,cls (:foreground ,blue))))
 `(spaceline-server-crashed-face ((,cls (:foreground ,red))))

 ;;; evil
 ;; permenent color of highlighted search results. Can be hidden using :nohlsearch
 `(evil-search-highlight-persist-highlight-face ((,cls (:background ,line-highlight-bg :foreground ,orange :inherit bold))))
 `(vimish-fold-overlay ((,cls (:background ,dark-grey :foreground ,green))))

 ;;; minibuffer & helm
 `(minibuffer-prompt ((,cls (:foreground ,yellow :weight bold)))) ; NOTE optional read only text preceding minibuffer input

 ;;; flycheck
 `(flycheck-info ((,cls (:underline (:style wave :color ,green)))))
 `(flycheck-warning ((,cls (:underline (:style wave :color ,yellow)))))
 `(flycheck-duplicate ((,cls (:underline (:style wave :color ,orange)))))
 `(flycheck-incorrect ((,cls (:underline (:style wave :color ,red)))))
 `(flycheck-fringe-info ((,cls (:foreground ,green-int :inherit fringe))))
 `(flycheck-fringe-warning ((,cls (:foreground ,yellow-int :inherit fringe))))
 `(flycheck-fringe-error ((,cls (:foreground ,red-int :inherit fringe))))

 ;;; frog jump buffer and avy
 `(avy-background-face ((,cls (:foreground ,grey))))
 `(avy-lead-face ((,cls (:background ,red-int :foreground "white"))))
 `(avy-lead-face-0 ((,cls (:background ,blue-int :foreground "white"))))
 `(avy-lead-face-1 ((,cls (:background ,very-light-grey :foreground ,very-dark-grey))))
 `(avy-lead-face-2 ((,cls (:background ,purple-int :foreground "white"))))
 `(frog-menu-border ((,cls (:background ,white :foreground ,white))))
 `(frog-menu-posframe-background-face ((,cls (:background ,very-dark-grey))))

 ;;; company - intellisense
 ;; NOTE foreground-color  very-dark-grey
 ;;      background-color  very-light-grey
 ;;      active-foreground very-light-grey
 ;;      active-background blue
 ;;      sp-color          turquoise-int
 `(company-tooltip-mouse ((,cls (:foreground ,turquoise-int))))
 `(company-template-field ((,cls (:foreground ,turquoise-int))))

 ;; scrollbar
 `(company-scrollbar-bg ((,cls (:background ,very-light-grey :foreground ,very-light-grey))))
 `(company-scrollbar-fg ((,cls (:background ,dark-grey       :foreground ,dark-grey))))

 ;; NOTE preview is for the leading text for a the sole match on a line
 `(company-preview ((,cls (:foreground ,blue-int :weight bold :inherit hl-line))))
 `(company-preview-common ((,cls (:inherit company-preview))))
 `(company-preview-search ((,cls (:foreground ,orange-int :weight normal :inherit company-preview))))

 ;; NOTE tooltip is the drop down menu which shows up when multiple results exist
 `(company-tooltip ((,cls (:background ,very-light-grey :foreground ,very-dark-grey :inherit bold))))
 `(company-tooltip-common ((,cls (:foreground ,blue-int :inherit company-tooltip))))
 `(company-tooltip-selection ((,cls (:foreground ,very-light-grey :background ,blue-int))))
 `(company-tooltip-common-selection ((,cls (:foreground ,very-dark-grey :background ,blue-int :inherit company-tooltip-common))))
 `(company-tooltip-search ((,cls (:foreground ,orange :inherit company-tooltip))))
 `(company-tooltip-search-common ((,cls (:inherit company-tooltip-search))))
 `(company-tooltip-search-selection ((,cls (:background ,blue-int :inherit company-tooltip-search))))

 ;; NOTE annotations are extra information in stdout
 `(company-tooltip-annotation ((,cls (:weight bold :foreground ,grey))))
 `(company-tooltip-annotation-selection ((,cls (:foreground ,turquoise-int :background ,blue-int :inherit company-tooltip-annotation))))

 ;;;; custom mode variants
 ;;; whitespace-mode
 ;; `(whitespace-trailing ((,cls (:foreground "yellow" :background ,red))))
 `(whitespace-space ((,cls (:foreground ,dark-grey))))
 `(trailing-whitespace ((,cls (:background ,dark-grey))))

 ;;; auto-highlight-symbol mode
 ;; Note: distant foreground is meaningless here because the faces are always given pririty
 `(ahs-definition-face ((,cls (:background ,blue-dim :distant-foreground ,blue-dim :foreground ,dark-grey))))
 `(ahs-edit-mode-face ((,cls (:background ,red-dim :distant-foreground ,red-dim :foreground ,very-light-grey))))
 `(ahs-face ((,cls (:background ,very-light-grey :foreground ,black :inherit bold)))) ; NOTE matching selections
 `(ahs-plugin-whole-buffer-face ((,cls (:background ,blue :distant-foreground ,green :foreground ,black))))
 `(ahs-plugin-bod-face ((,cls (:background ,blue-int :distant-foreground ,blue-int :foreground ,black))))
 `(ahs-plugin-defalt-face ((,cls (:background ,orange-dim :distant-foreground ,orange-dim :foreground ,black))))
 `(ahs-warning-face ((,cls (:foreground ,red-dim))))

 ;;; compilation mode
 `(compilation-line-number ((,cls (:foreground ,yellow))))
 `(compilation-column-number ((,cls (:inherit font-lock-doc-face))))
 ;; NOTE also represents value count in mode line
 ;; `(compilation-error ((,cls (:background ,red-int :distant-foreground ,red-int :foreground ,very-dark-grey))))
 ;; `(compilation-info ((,cls (:background ,green-int :distant-foreground ,green-int :foreground ,very-dark-grey))))
 ;; `(compilation-warning ((,cls (:background ,orange-int :distant-foreground ,orange-int :foreground ,very-dark-grey))))
 `(compilation-error ((,cls (:foreground ,red-int :inherit bold))))
 `(compilation-info ((,cls (:foreground ,green-int :inherit bold))))
 `(compilation-warning ((,cls (:foreground ,orange-int :inherit bold))))
 ;; NOTE theses only represent the exit status indicator
 `(compilation-mode-line-exit ((,cls (:foreground ,very-dark-grey))))
 `(compilation-mode-line-fail ((,cls (:foreground ,very-dark-grey))))
 `(compilation-mode-line-run ((,cls (:foreground ,very-dark-grey))))

 ;;; markdown-mode
 `(markdown-code-face ((,cls (:inherit default))))

 ;;; anzu
 `(anzu-mode-line ((,cls (:foreground ,very-dark-grey :inherit bold))))
 `(anzu-mode-line-no-match ((,cls (:foreground ,red-int :inherit bold))))

 ;;; hydra-posframe
 ;; for some reason... if hydra-posframe-face inherits default, internal border won't work
 `(hydra-posframe-face ((,cls (:background ,very-dark-grey :foreground ,very-light-grey))))
 `(hydra-posframe-border-face ((,cls (:inherit internal-border))))

 ;;; org-mode
 `(org-link ((,cls (:foreground ,turquoise :inherit bold))))
 `(org-footnote ((,cls (:foreground ,blue))))
 ;; Overridden by hl-todo-keyword-faces
 `(org-todo ((,cls (:foreground ,purple-int :inherit bold))))
 `(org-done ((,cls (:foreground ,green-int :inherit bold))))
 ;; `(org-warning ((,cls (:foreground ))))
 `(org-upcoming-deadline ((,cls (:foreground ,red-dim))))
 `(org-warning ((,cls (:foreground ,orange :inherit bold))))
 `(org-scheduled-today ((,cls (:foreground ,green-int))))
 `(org-block-begin-line ((,cls :background "royalblue4" :distant-foreground "royalblue4" :foreground "steelblue1" :extend t)))
 ;; `(org-block-begin-line ((,cls :background "royalblue4" :distant-foreground "royalblue4" :foreground ,turquoise-int)))
 `(org-meta-line ((,cls (:inherit (font-lock-comment-face)))))
 ;; `(org-meta-line ((,cls (:background "springgreen4" :distant-foreground "springgreen4" :foreground "springgreen1"))))

 `(org-block ((,cls (:background ,extra-dark-grey :extend t))))
 `(org-document-title ((,cls (:foreground "white" :height 1.3 :inherit bold))))

 `(dashboard-text-banner ((,cls (:foreground ,orange-int))))

 ;; eshell-prompt-extras
 `(epe-remote-face ((,cls (:foreground ,turquoise))))
 `(epe-venv-face ((,cls (:foreground ,purple))))

 ;; magit
 `(magit-mode-line-process-error ((,cls (:foreground ,red :background ,very-light-grey :inherit bold))))

 ;; flyspell
 `(flyspell-duplicate ((,cls (:foreground ,orange-dim :underline t))))
 `(flyspell-incorrect ((,cls (:foreground ,red-dim :underline t))))

 ;; typescript
 `(typescript-primitive-face ((,cls (:inherit font-lock-type-face))))

 ;; latex
 `(font-latex-sedate-face ((,cls (:inherit font-lock-keyword-face))))
 `(font-latex-sectioning-0-face ((,cls (:inherit font-lock-function-name-face))))
 `(font-latex-sectioning-1-face ((,cls (:inherit font-lock-function-name-face))))
 `(font-latex-sectioning-2-face ((,cls (:inherit font-lock-function-name-face))))
 `(font-latex-sectioning-3-face ((,cls (:inherit font-lock-function-name-face))))
 `(font-latex-sectioning-4-face ((,cls (:inherit font-lock-function-name-face))))
 `(font-latex-sectioning-5-face ((,cls (:inherit font-lock-function-name-face))))

 ;;; ivy
 ;; `(ivy-current-match ((,cls :backgrouns ,blue-dim :foreground ,black))) ;; hl-line
 ;; `(ivy-confirm-face ((,cls :foreground ,green-dim :inherit bold)))
 ;; `(ivy-match-required-face ((,cls (:foreground ,red-int :inherit bold)))) ;; no candidate chosen
 )

(custom-theme-set-variables 'an-old-hope
  `(hl-todo-keyword-faces '(("TODO"        . ,red)
                            ("NEXT"        . ,red)
                            ("RANT"        . ,red)
                            ("SEE"         . ,red)
                            ("THEM"        . ,purple)
                            ("PROG"        . ,blue-int)
                            ("OKAY"        . ,blue-int)
                            ("DONT"        . ,green-int)
                            ("FAIL"        . ,red)
                            ("DONE"        . ,green-int)
                            ("NOTE"        . ,yellow-int)
                            ("KLUDGE"      . ,yellow-int)
                            ("HACK"        . ,yellow-int)
                            ("TEMP"        . ,yellow-int)
                            ("FIXME"       . ,orange)
                            ("WARN"        . ,orange)
                            ("XXX+"        . ,orange)
                            ("\\?\\?\\?+"  . ,orange))))
(put 'custom-theme-set-variables 'lisp-indent-function 'defun)

(provide-theme 'an-old-hope)

;; unbind all assigned colors
(dolist (color colors)
  (makunbound (car color)))
)
;; Faces:1 ends here

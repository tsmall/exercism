;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(load "~/.emacs.d/el-get/dash/dash.el")
(require 'dash)
(require 'seq)

(defun char-is-letter (c)
  "Returns `t' if C is a letter (a-z, A-Z), `nil' otherwise."
  (or (<= ?a c ?z)
      (<= ?A c ?Z)))

(defun is-pangram (sentence)
  "Returns `t' if SENTENCE is a pangram, `nil' otherwise."
  (->> (downcase sentence)
       (seq-filter 'char-is-letter)
       (delete-dups)
       (length)
       (= 26)))

(provide 'pangram)
;;; pangram.el ends here

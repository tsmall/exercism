;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun is-pangram (sentence)
  "Returns `t' if SENTENCE is a pangram, `nil' otherwise."
  (let* ((alphabet "abcdefghijklmnopqrstuvwxyz")
         (sentence (downcase sentence))
         (in-sentence-p (apply-partially 'seq-contains sentence)))
    (seq-every-p in-sentence-p alphabet)))

(provide 'pangram)
;;; pangram.el ends here

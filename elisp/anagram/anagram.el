;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(load "~/.emacs.d/el-get/dash/dash.el")
(require 'dash)
(require 'cl)

(defun characters-in (string)
  "Returns a list containing the sorted, lowercase characters in STRING."
  (-> string
      (downcase)
      (split-string "" t)
      (->> (mapcar 'string-to-char))
      (sort '<)))

(defun anagram? (word candidate)
  "Returns `t' if CANDIDATE is an anagram of WORD, `nil' otherwise."
  (if (string= word candidate)
      nil
    (equal (characters-in word)
           (characters-in candidate))))

(defun anagrams-for (word candidates)
  "Returns the words in list CANDIDATES that are anagrams of WORD."
  (cl-remove-if-not (apply-partially 'anagram? word) candidates))

(provide 'anagram)
;;; anagram.el ends here

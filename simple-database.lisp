(defvar *db* nil)

(defun make-record (title artist date rating) 
  (list :title title :artist artist 
  :date date :rating rating))

(defun add-record (record) (push record *db*))

(defun show-db ()
  (dolist (item *db*)
    (format t "~{~a:~10t~a~%~}~%" item)))

(defun prompt-for-record ()
  (make-record
    (prompt-read "Title")
    (prompt-read "Artist")
    (prompt-read "Date")
    (parse-rating (prompt-read "Rating"))))

(defun parse-rating (rating)
  (or (parse-integer rating :junk-allowed t) 0))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))
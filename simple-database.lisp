(defvar *db* nil)



(defun add-record (record) (push record *db*))

(defun make-record (title artist date rating) 
  (list :title title :artist artist 
  :date date :rating rating))

(defun save-db (filename)
  (with-open-file (out filename
                    :direction :output
                    :if-exists :supersede)
    (with-standard-io-syntax 
      (print *db* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun show-db ()
  (dolist (item *db*)
    (format t "~{~a:~10t~a~%~}~%" item)))

(defun parse-rating (rating)
  (or (parse-integer rating :junk-allowed t) 0))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-record ()
  (make-record
    (prompt-read "Title")
    (prompt-read "Artist")
    (prompt-read "Date")
    (parse-rating (prompt-read "Rating"))))

(defun add-records ()
  (loop (add-record (prompt-for-record))
    (if (not (y-or-n-p "Another? [y/n]: ")) (return))))
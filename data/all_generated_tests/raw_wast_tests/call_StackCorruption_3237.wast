;; Test invoking a function with an invalid function index, ensuring stack integrity is maintained while raising an appropriate trap error for out-of-bounds indices.

(assert_invalid
  (module
    (func (call 100))
  )
  "unknown function"
)
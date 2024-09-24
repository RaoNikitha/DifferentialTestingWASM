;; - Test Case 5: Structure a sequence with multiple nested loops and a `br` in the innermost loop directed to a label at the outer loop level, followed by an `unreachable`. This checks for correct unwinding and label resolution across multiple loop levels.

(assert_invalid
  (module
    (func (loop (block (loop (block (br 3))) (unreachable)) (end)))
  )
  "break to invalid label"
)
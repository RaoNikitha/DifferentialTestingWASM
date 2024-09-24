;; 3. Construct a function with multiple nested loops, placing `unreachable` inside the innermost loop. Observing different implementations, check that the loop structures are unwound correctly and the stack remains uncorrputed.

(assert_invalid
  (module (func $test-nested-loops-unreachable
    (loop (loop (loop (unreachable))))
  ))
  "type mismatch"
)
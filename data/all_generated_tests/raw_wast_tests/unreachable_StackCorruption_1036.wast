;; 7. Test Description: Place `unreachable` after a large number of sequential stack operations (e.g., multiple `i32.const` and arithmetic operations) to see how it influences stack depth and prevents overflows.

(assert_invalid
  (module (func $test-unreachable-stack-depth
    (i32.const 1) (i32.const 1) (i32.const 1) (i32.add) (i32.add) (i32.add) (unreachable) (i32.add)
  ))
  "type mismatch"
)
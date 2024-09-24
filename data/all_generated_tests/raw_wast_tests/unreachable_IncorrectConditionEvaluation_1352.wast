;; 3. Implement an `if` condition that compares two integers for equality (e.g., `i32.eq`), and in the false branch, include `unreachable`. Design the test to ensure the condition should never be true. The test verifies if the `unreachable` trap is triggered unexpectedly.

(assert_invalid
  (module (func $if-condition-with-unreachable (result i32)
    (if (result i32) (i32.eq (i32.const 0) (i32.const 1))
      (then (i32.const 1))
      (else (unreachable))
    )
    (i32.const 0)
  ))
  "type mismatch"
)
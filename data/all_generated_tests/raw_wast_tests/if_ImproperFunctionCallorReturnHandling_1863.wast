;; A test with an `if` block that conditionally executes a function with a valid type but the `else` branch calls another function with mismatched return type, verifying if the stack unwinding and label management properly handle the discrepancies.

(assert_invalid
  (module (func $type-conditional-mismatch (result i32)
    (if (result i32) (i32.const 1) (then (call $valid_function)) (else (call $mismatch_function)))
  ))
  "type mismatch"
)
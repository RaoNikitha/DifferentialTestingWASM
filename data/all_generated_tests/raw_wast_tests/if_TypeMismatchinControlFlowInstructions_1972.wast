;; Test 3: Create an `if` block with an `i32` input type, followed by an `else` block that takes an `f64` input type, violating the input stack type consistency.

(assert_invalid
  (module (func $type-else-input-mismatch
    (if (result i32) (i32.const 1) (then (i32.const 1)) (else (f64.const 1.0)))
  ))
  "type mismatch"
)
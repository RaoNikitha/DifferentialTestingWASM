;; - Try an `if` block with multiple conditions chained using logical operators (e.g., and, or) to verify if the combined condition evaluation leads to the accurate execution path in both implementations.

(assert_invalid
  (module (func $chained-conditions-invalid (result i32)
    (if (result i32) (i32.and (i32.const 1) (i32.const 0)) (then (i32.const 1)) (else (i32.const 2)))
  ))
  "type mismatch"
)
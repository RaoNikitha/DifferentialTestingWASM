;; 6. Define a `block` with a complex sequence of instructions where an `i32` is consumed but the resulting type is expected to be `i64`, to see if the stack behaviors are validated.

(assert_invalid
  (module (func $test-block-stack-behavior-mismatch (result i64)
    (block (result i64) (i32.const 10) (drop) (i64.const 20))
  ))
  "type mismatch"
)
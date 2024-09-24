;; A `block` that starts with an empty stack, performs operations to push several values of different types, and ends with a specific block result type, checking if the stack compliance is preserved.

(assert_invalid
  (module (func $block-stack-compliance-test (result i32)
    (block (result i32)
      (i32.const 10)
      (i64.const 20)
      (f32.const 30.0)
      (f64.const 40.0)
      (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)
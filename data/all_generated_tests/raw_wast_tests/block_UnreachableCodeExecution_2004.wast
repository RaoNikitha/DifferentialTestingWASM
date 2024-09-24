;; 5. Nest a `block` within another `block`. If the inner block does not correctly match the outer block's result type, leading to a branch to an `unreachable` in case of a stack mismatch, the test checks operand transfer stack management.

(assert_invalid
  (module (func $nested-block-invalid-stack (result i32)
    (block (result i32)
      (block (result f64)
        (br 1 (i32.const 0))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)
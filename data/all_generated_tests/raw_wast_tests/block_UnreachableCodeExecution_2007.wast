;; 8. Use a `block` that modifies the stack with various data types, ending with an `unreachable` if the stack's state does not conform to a specific pattern expected by the block's result type, testing complex operand interactions within the block.

(assert_invalid
  (module (func $complex-operand-interaction (result i32)
    (block (result i32)
      (i32.const 1)
      (f32.const 2.0)
      (i32.trunc_f32_s)
      (unreachable)
    )
  ))
  "type mismatch"
)
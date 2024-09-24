;; 9. Develop a `block` that includes a `call` to a function that might return an unexpected type, leading to an `unreachable` upon re-evaluating the block's result type, scrutinizing inter-function calls and their impact on the block's operand stack.

(assert_invalid
  (module
    (func $unexpected_return (result f32) (f32.const 0.0))
    (func $block_with_call
      (block (result i32) (call $unexpected_return) (i32.const 1))
    )
  )
  "type mismatch"
)
;; 1. **Test Name: Conditional Stack Reduction**    - **Description**: Create a test where the `if` condition pops an `i32` from the stack, followed by a sequence of operations inside the `then` block designed to consume more items than available. The `else` block should correctly handle any stack deficit to verify the boundary condition handling of the stack.      ```wasm      (i32.const 1) (if (result i32) (i32.const 1) (i32.add) else (i32.const 0) end)      ```    - **Reasoning**: Ensures that incorrect residual stack heights don't lead to stack corruption due to unhandled balance discrepancy between `then` and `else` blocks.

(assert_invalid
 (module
  (func (param i32) (result i32)
   (i32.const 1)
   (if (result i32) (i32.const 1) (i32.add) else (i32.const 0) end)
  )
 )
 "type mismatch"
)
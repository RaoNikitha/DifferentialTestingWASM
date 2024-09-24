;; 1. **Nested Loop Stack Unwinding:**    - Test a deeply nested loop with multiple layers, each containing `br` instructions that target different loop layers.    - This test checks whether the operand stack is correctly unwound to the height of each loop layer and ensures consistent loop entry and exit behavior.

(assert_invalid
  (module
    (func $nested_loop_stack_unwinding (result i32)
      (loop (result i32)
        (i32.const 1)
        (loop (result i32)
          (br 1) 
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)
;; 4. **Test 4 - Incorrect Operand Stack Handling**:    Design a `br_table` where the operand stack type after unwinding does not match the expected stack type for the target block, resulting in a branch to incorrect stack state. This ensures CFG validity related to stack management.

(assert_invalid
  (module
    (func $incorrect_stack_handling
      (block (result i32)
        (block (result i32)
          (block
            (i32.const 1)
            (br_table 0 1 (i32.const 2)) 
          )
        )
      )
    )
  )
  "type mismatch"
)
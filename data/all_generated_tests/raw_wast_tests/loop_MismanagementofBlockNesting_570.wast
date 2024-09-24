;; 1. **Nested Loop Returning Incorrect Operand Stack Height**:    Test a nested loop where an inner loop branches out using `br_table` to an outer loop but misinterprets the operand stack height.    This tests correct handling of operand stack unwinding in nested structures.

(assert_invalid
  (module
    (func $nested-loop-stack-height
      (i32.const 0)
      (block (loop (result i32)
        (block
          (loop (result i32)
            (br_table 0 0)
          )
        )
      ))
    )
  )
  "type mismatch"
)
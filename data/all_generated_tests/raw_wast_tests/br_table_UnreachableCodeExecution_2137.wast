;; 7. **Test with Cross-Block Operand Stack Configuration:**    - Description: Create a `br_table` where the operand stack configuration needs to be correctly maintained across multiple blocks.    - Constraint Checked: Correct stack management across multiple control blocks.    - Relates to Unreachable Code Execution: Improper stack management could direct control flow to code that should be unreachable.

(assert_invalid
  (module
    (func $cross-block-operand-stack
      (block
        (i32.const 0)
        (block
          (i64.const 1)
          (br_table 0 0 1) 
        )
        (drop) 
      )
    )
  )
  "type mismatch"
)
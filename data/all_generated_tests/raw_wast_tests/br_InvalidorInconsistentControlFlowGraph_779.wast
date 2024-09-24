;; 10. **Type Mismatch in Loop’s Backward Branch:**    - Construct a loop where the `br` to the loop includes operand types mismatched with the loop’s type signature.    - Reasoning: Checks consistency of operand stack types for backward branches to loops.    - Relation to CFG: Inconsistencies can corrupt loop handling in the CFG, leading to invalid loops or defective backward jumps.

(assert_invalid
  (module
    (func $type-mismatch-loop-br
      (loop (result i32)
        (i32.const 1) (br 0)
      )
    )
  )
  "type mismatch"
)
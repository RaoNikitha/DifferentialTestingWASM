;; 7. **Test with All Target Labels Leading to Same Block**:    - **Description**: A `br_table` where every index leads to the same target block, and this block contains a `return` instruction.    - **Relation to Edge Case**: Verifies if the return instruction in a uniform target scenario properly unwinds the operand stack without discrepancies.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (block $outer
        (block $inner
          (br_table 0 0 0 (local.get 0))
          (return (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
;; 10. **Test Description**:    Formulate a test with nested blocks where each inner block introduces a branching label through `br_table` that transforms based on stack values, demanding accurate context management. This is to ensure the stack's final state matches the block’s closing context and correct labels are maintained throughout.

(assert_invalid
  (module
    (func $nested-blocks-br-table (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 0 (i32.const 1))
            (i32.const 2)
          )
          (i32.const 3)
        )
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)
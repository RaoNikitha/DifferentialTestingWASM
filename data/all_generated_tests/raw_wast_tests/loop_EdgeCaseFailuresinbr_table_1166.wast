;; 7. **Test Description**:     Formulate a loop containing dead code paths and a `br_table` instruction within a never-taken branch, testing index out-of-bounds in non-executed context.     - **Constraint**: Ensures unexecuted paths containing `br_table` behave correctly with out-of-bounds indexes.     - **Edge Case**: Tests non-active paths for proper handling of `br_table` index resolution.

(assert_invalid
  (module (func $dead-code-br_table 
    (loop (result i32) 
      (br 0) 
      (block 
        (br_table 1 0 (i32.const 2))
      ) 
      (i32.const 0)
    )
  ))
  "br_table index out of bounds"
)
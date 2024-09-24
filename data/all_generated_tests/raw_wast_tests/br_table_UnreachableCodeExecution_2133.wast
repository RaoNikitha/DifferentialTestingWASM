;; 3. **Test with Nested Blocks and Relative Label Indexing:**    - Description: Create a nested block structure where `br_table` instructions use relative indexing to ensure that branching occurs correctly within nested contexts.    - Constraint Checked: Correct handling of relative label indices within nested blocks.    - Relates to Unreachable Code Execution: Incorrect relative label indexing could lead to branching to unintended parts of code, triggering the `unreachable` instruction.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br_table 0 2 1 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)
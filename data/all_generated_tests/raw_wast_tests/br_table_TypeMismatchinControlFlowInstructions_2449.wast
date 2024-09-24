;; 9. **Unwinding to Different Depths with Mismatched Stack Types:**    Create a sequence with nested blocks and loops where a `br_table` instruction tries to branch to labels at different nesting depths with mismatched stack types. This tests if the implementation manages stack types correctly upon control transfer.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i64)
          (loop (result i32)
            (br_table 1 0 (i32.const 2) (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)
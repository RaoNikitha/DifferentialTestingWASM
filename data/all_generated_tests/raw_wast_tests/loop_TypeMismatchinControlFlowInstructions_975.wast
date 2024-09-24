;; 6. **Test 6: Loop with Wrongly Typed `br_table`**    - Description: Use a `br_table` within a loop, where the table indices assume a type different from the enclosing loop's block type result.    - Reasoning: This ensures that the `br_table` instruction is correctly validated against the context it operates within, maintaining type coherence.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (br_table 0 1 (i64.const 42))
      )
    )
  )
  "type mismatch"
)
;; 3. Construct a block that includes a `br_table` instruction with sparse and scattered targets. Ensure the sparse table includes explicit and implicit fallthrough cases to test the accurate generation and interpretation of the CFG.

(assert_invalid
  (module (func $br_table_sparse
    (block (result i32)
      (block (result i32)
        (br_table 0 1 2 (i32.const 0))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)
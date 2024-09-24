;; 5. **Test 5**: Introduce a `br` instruction within a block that marks a target label influenced by a previous `br_table`’s execution. Ensure that the control accurately resolves target positions considering stack height changes caused by previous branch instructions.

(assert_invalid
  (module
    (func $br-table-within-block
      (block
        (block
          (br_table 0 1 (i32.const 0))
          (br 1)
        )
      )
    )
  )
  "unknown label"
)
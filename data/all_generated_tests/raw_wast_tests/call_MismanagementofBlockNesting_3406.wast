;; 5. **Immediate `br_table` Execution**: Place a `call` instruction right before a `br_table` within a nested block structure. Verify that the `br_table` executes correctly based on the block depths and each branch target is accurately identified post-function call.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (call 0)
        (br_table 0 1 (i32.const 1))
      )
      (block
        (br 1)
      )
    )
    (func (param i32))
  )
  "unknown function"
)
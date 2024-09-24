;; 6. Create a test where the `br_table` instruction has a label vector with matching types but different operand stack heights. Verify correct stack state post-branch.

(assert_invalid
  (module (func $stack-height-mismatch
    (block (result i32)
      (block (result i32 i32)
        (br_table 0 1 (i32.const 0) (i32.const 0))
      )
    )
  ))
  "type mismatch"
)
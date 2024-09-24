;; 2. **Test Description:**    Use a `br` instruction to exit an `if` block with different result types than the input types of the block.     **Constraint Checked:** Proper handling of operand restoration based on block output types.    **Relation to Stack Corruption:** Mismanagement could leave the stack in an inconsistent state, leading to corruption.

(assert_invalid
  (module
    (func $test-incorrect-br-in-if
      (block (result i32)
        (i32.const 0) (i32.const 1)
        (if (result i32) (then (br 0)))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)
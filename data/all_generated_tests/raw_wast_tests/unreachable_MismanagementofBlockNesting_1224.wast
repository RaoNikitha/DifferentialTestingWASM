;; 5. **Br_table Exiting Multiple Nested Levels with Unreachable:**    - Construct nested blocks with a `br_table` instruction that targets different block levels and places `unreachable` right before the `br_table` instruction. Check if the control flow jumps correctly to the intended block and traps as expected.

(assert_invalid
  (module
    (func
      (block $outer
        (block $inner
          (unreachable)
          (br_table $inner $outer (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
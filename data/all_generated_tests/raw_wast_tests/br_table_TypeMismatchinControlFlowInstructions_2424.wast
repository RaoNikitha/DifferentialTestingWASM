;; 4. Test Description 4: Construct an `if` block with a `br_table` that branches to another nested block, ensuring there is a type inconsistency between the stack at the `br_table` instruction and the target label’s expected types.

(assert_invalid
  (module
    (func $nested-if-br_table
      (block
        (i32.const 0)
        (if
          (then
            (block
              (br_table 0 (i64.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 4. **Deeply Nested Tables**: Construct a function comprising nested blocks and loops combined with a `br_table` instruction, followed by a `return` statement after the `br_table`. The test checks for incorrect block depth resolution leading to mismanagement of the control flow.

(assert_invalid
  (module
    (func $deeply-nested-br-table-return
      (block
        (loop
          (block
            (block
              (block
                (br_table 0 1 2 3 4)
                (return)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
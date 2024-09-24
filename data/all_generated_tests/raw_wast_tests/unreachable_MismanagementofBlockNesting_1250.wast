;; 1. **Test 1:** Create a function with a deeply nested block structure containing multiple nested block instructions, ensuring that each block has a `br_table` instruction at various depths leading to an `unreachable`:    - **Check:** Verify if the `unreachable` within nested blocks causes the correct trap without executing further instructions.    - **Constraint:** Ensures correct recognition and handling of the `unreachable` within nested blocks.

(assert_invalid
  (module (func $deeply_nested_unreachable_with_br_table
    (block
      (block
        (block
          (block
            (block
              (block
                (unreachable)
                (br_table 0)
              )
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)
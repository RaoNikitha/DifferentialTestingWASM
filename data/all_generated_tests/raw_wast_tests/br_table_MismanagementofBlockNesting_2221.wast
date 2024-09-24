;; 1. Test a `br_table` instruction within a deeply nested structure where the operand value matches exactly one of the labels in the vector. This checks if the implementation correctly resolves nested blocks and targets the specified label accurately.

(assert_invalid
  (module (func $deep-nested-structure
    (block
      (block
        (block
          (block
            (block
              (block
                (br_table 1 0 2 3 4 5 6 7 (i32.const 3))
              )
            )
          )
        )
      )
    )
  ))
  "unknown label"
)
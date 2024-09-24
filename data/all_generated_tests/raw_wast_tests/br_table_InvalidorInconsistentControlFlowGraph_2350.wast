;; Test 10: Design a sequence where `br_table` targets valid and invalid block indexes in long control flow constructs with deep nesting, ensuring control flow remains consistent and valid. - **Constraint Tested**: Consistency and validity of control flow in deep and complex nested blocks.

(assert_invalid
  (module (func $deep-nesting
    (block
      (loop
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br_table 0 0 2 3 4 5 6 7 8
                        (i32.const 10)) ; operand out of bounds test
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  ))
  "unknown label"
)
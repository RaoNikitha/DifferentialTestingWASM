;; ```plaintext 1. Define a `br_table` within a deeply nested block structure, and include an operand index that should branch to a label several levels up the nesting hierarchy. This test checks if both implementations correctly manage label indices across multiple nesting levels, especially verifying the endpoint label is reached.

(assert_invalid
  (module
    (func $deeply-nested (param i32)
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br_table 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 (i32.const 22))
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)
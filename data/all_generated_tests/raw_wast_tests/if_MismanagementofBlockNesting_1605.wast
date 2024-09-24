;; 6. A test where an `if` instruction is used within a block that has multiple `else` branches, and each `else` contains nested `if` instructions. This evaluates if the multiple levels of conditional nesting are managed properly for each branch scenario.

(assert_invalid
  (module
    (func
      (block
        (if (i32.const 1)
          (then
            (i32.const 1)
            (else
              (if (i32.const 0)
                (then (i32.const 1))
                (else (i32.const 2))
              )
            )
          )
        )
        (else
          (if (i32.const 1)
            (then (i32.const 1))
            (else (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)
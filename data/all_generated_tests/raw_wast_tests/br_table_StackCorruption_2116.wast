;; Test 6: Use a complex control flow with deeply nested structures involving `if` and `block` constructs, bounded by a `br_table` instruction. Inspect for any stack corruption when the instruction attempts to branch into and out of these nested control structures.

(assert_invalid
  (module
    (func (result i32)
      (block
        (block
          (if (i32.const 1)
            (then
              (block
                (br_table 0 1 2 (i32.const 2))
              )
            )
            (else
              (block
                (br_table 0 1 2 (i32.const 3))
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "unknown label"
)
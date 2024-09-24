;; Formulate a test with multiple nested `if-else` blocks and insert a `br` instruction targeting a label within the innermost `else` block (`label 0`). Ensure the `br` instruction correctly references the innermost `else` block, not an outer block.

(assert_invalid
  (module
    (func $nested-if-br
      (block
        (if (result i32)
          (i32.const 1)
          (i32.const 42)
          (else
            (if (result i32)
              (i32.const 1)
              (i32.const 24)
              (else
                (block (result i32) (i32.const 0) (br 0))
              )
            )
          )
        )
        (i32.eqz)
        (drop)
      )
    )
  )
  "type mismatch"
)
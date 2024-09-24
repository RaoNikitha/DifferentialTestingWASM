;; Create a compound test with nested `block`, `loop`, and `if-else` structures. Insert a `br` instruction targeting a `loop` within an `if` block (`label 2`). Validate that the branch correctly resolves to the `loop` and jumps to its start.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (then
              (br 2)
            )
            (else
              (i32.const 42)
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
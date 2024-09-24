;; 5. A block expecting an `i32`, but a `br` instruction inside a nested `if` statement pushes an `i64` onto the stack, causing a type mismatch upon exiting the block.

(assert_invalid
  (module
    (func $type-block-mismatch
      (block (result i32)
        (if (i32.const 1)
          (then
            (br 0 (i64.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)
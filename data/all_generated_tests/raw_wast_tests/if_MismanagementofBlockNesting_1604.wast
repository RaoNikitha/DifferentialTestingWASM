;; 5. An `if` instruction with nested blocks where each block has its own labels referred through `br` or `br_if` instructions. This would check if the label referencing is managed accurately inside nested blocks when conditions are met or skipped.

(assert_invalid
  (module
    (func $nested-block-labels
      (if (result i32) (i32.const 1)
        (then
          (block (result i32)
            (block (result i32)
              (br 1)
              (i32.const 0)
            )
            (i32.const 2)
          )
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)
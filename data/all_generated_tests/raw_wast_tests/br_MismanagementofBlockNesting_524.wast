;; 5. Use a nested `if-else` structure with an inner `block`, and place a `br` instruction within the inner `block` to jump to the outer `block`. This ensures correct branch behavior from nested `if-else` blocks to outer structures.

(assert_invalid
  (module (func $nested_if_else_block
    (block
      (if (i32.const 1)
        (then
          (block
            (br 1)
          )
        )
        (else
          (nop)
        )
      )
    )
  ))
  "unknown label"
)
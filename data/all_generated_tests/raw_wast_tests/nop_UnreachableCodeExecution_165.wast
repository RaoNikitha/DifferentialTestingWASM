;; 6. Place `nop` in the body of a nested block structure with an `unreachable` instruction at the outer block's end. Ensure the control flow does not skip the inner block and hit the `unreachable` instruction.

(assert_invalid
  (module
    (func
      (block
        (block
          (nop)
        )
        (unreachable)
      )
    )
  )
)
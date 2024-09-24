;; 3. Create a function with nested blocks where the innermost block contains an `unreachable` instruction, ensuring execution doesn't proceed beyond the `unreachable` instruction.

(assert_invalid
  (module (func
    (block
      (block
        (unreachable)
        (i32.const 1)
      )
    )
  ))
  "type mismatch"
)
;; 1. **Branch to Exterior Label from Within `if` Block**:    - Create an `if` block where the `else` part contains a `br` instruction targeting an exterior block label.    - Observing if the nested context correctly resolves the external label can highlight issues where the `br` incorrectly resolves within the `if` block.    - The test checks if the forward branch within an `if-else` construction is correctly targeted outside scope.

(assert_invalid
  (module
    (block $outer
      (if (i32.const 0)
        (then (nop))
        (else (br $outer))
      )
    )
  )
  "type mismatch"
)
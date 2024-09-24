;; 5. **`nop` within a function body missing return type**:    Include a `nop` instruction in a function that should return a specific type but does not do so due to the missing stack value.    This tests the function's type validation against its signature.

(assert_invalid
  (module
    (func $type-f32-missing-return (result f32)
      (nop)
    )
  )
  "type mismatch"
)
;; 7. Introduce a `nop` instruction inside a conditional `block` that contains a `br_if`. Ensure the condition evaluation leading to the branch decision is correct, ensuring `nop` does not alter the expected behavior.

(assert_invalid
  (module
    (func (result i32)
      (block $label
        (i32.const 1)
        (br_if $label (i32.const 1))
        (nop)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
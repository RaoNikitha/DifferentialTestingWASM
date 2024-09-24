;; 8. **`nop` within a mismatched loop return type**:    Include a `nop` instruction inside a loop where the loop's expected return type is not satisfied.    This tests the ability of the loop validation to account for no-ops when determining type correctness.

(assert_invalid
  (module
    (func $loop-nop-type-mismatch (result i32)
      (loop $label
        (nop)
      )
    )
  )
  "type mismatch"
)
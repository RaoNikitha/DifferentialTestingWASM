;; 4. **Test `nop` Impact on Stack Before Conditional Branch**: Add `nop` instructions before a `br_if` that evaluates a condition derived from stack values. Ensure that the presence of `nop` does not alter the condition's evaluation.

(assert_invalid
  (module
    (func (result i32)
      i32.const 1
      i32.const 0
      nop
      br_if 0
    )
  )
  "type mismatch"
)
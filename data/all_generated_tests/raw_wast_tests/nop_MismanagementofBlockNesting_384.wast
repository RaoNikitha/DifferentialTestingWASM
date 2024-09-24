;; 5. **Check nested labeled blocks for `nop` impact:** Use labeled blocks with nested `nop` instructions and perform branch operations to specific labels. Verify the function maintains the correct control flow and doesn’t skip over or improperly exit blocks due to `nop` influencing the validation state.

(assert_invalid
  (module
    (func (block $outer
      (block $inner
        (nop)
        (br $outer)
        (nop)
        (br $inner))
      (nop)))
  )
  "invalid block"
)
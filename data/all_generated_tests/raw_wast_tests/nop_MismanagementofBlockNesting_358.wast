;; 9. **Test Description**:    This test involves `br_if` instructions within nested structures interspersed with `nop` to validate that the break-if conditions are evaluated correctly and the presence of `nop` does not mismanage block or loop exits.

(assert_invalid
  (module
    (func (block $outer
      (block $inner
        (br_if $inner (i32.const 1))
        (nop)
        (br_if $outer (i32.const 0))
      )
      (nop)
    ))
  )
  "type mismatch"
)
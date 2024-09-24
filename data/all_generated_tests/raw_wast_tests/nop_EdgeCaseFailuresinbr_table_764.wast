;; 5. **Test Description**:    Use a `br_table` with a target index equal to the exact number of targets following sequences of `nop` instructions. This ensures `nop` does not mask an off-by-one error.      **Specific Constraint**: Checks off-by-one errors in index validation post `nop`.      **Edge Case**: Exact bound target in `br_table`.

(assert_invalid
  (module
    (func (block
      (block
        (block
          (nop)
          (nop)
          (nop)
          (br_table 0 1 2 3)
        )
      )
    ))
  )
  "br_table index out of bounds"
)
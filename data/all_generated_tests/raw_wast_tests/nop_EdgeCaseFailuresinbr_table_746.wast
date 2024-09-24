;; 7. **Test Description**: Combine `br` instructions with `nop` in such a way that `nop` precedes `br_table` calls within the same control block.    - **Constraint**: Verifying that the control transfer remains unaffected by the presence of `nop`.    - **Edge Case**: Confirming `br_table` properly deals with stack and control transfer even with out-of-bounds indices.

(assert_invalid
  (module
    (func (block (nop) (br_table 2 0 1) (nop)))
  )
  "br_table index out of bounds"
)
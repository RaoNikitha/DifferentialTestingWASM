;; 2. **Index Exactly at Boundary**:    Test a `br_table` instruction with a label vector of size N, and an operand of N. This will verify if the boundary condition is handled correctly, where the operand equals the size of the label vector and should use the default label.

(assert_invalid
  (module
    (func $index-at-boundary
      (block $default
        (block $label0
          (block $label1
            (block $block
              (i32.const 2)
              (br_table $label0 $label1 $default)
            )
          )
        )
      )
      (i32.eqz)
      (drop)
    )
  )
  "unknown label"
)
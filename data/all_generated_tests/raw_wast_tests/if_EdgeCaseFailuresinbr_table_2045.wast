;; 6. **Test Description**:     Construct an `if` block with a condition that arranges a mix of static and dynamic indices in `br_table`, with the dynamic index being out of bounds.    **Constraint**: Tests the handling of dynamically calculated indices within `br_table`.    **Edge Case Relation**: Verifies how dynamic index calculation and out-of-bounds handling are performed under an `if` instruction.

(assert_invalid
  (module
    (func $br_table_dynamic_out_of_bounds (param i32) (result i32)
      (if (result i32) 
        (i32.const 1) 
        (then 
          (br_table 0 1 (local.get 0))
          (i32.const 0)
        ) 
        (else 
          (br_table 0 (i32.const 5))
        )
      )
    )
  )
  "invalid br_table target"
)
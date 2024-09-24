;; 2. **Test for Exact Boundary Index**:    - **Description**: Create a `br_table` instruction with indices exactly equal to the number of target labels. This would ensure the boundary condition is tested properly.    - **Relation to Edge Case**: Verifies if the `return` instruction and `br_table` boundary conditions are correctly managed, ensuring no off-by-one errors in implementation.

(assert_invalid
  (module
    (func $boundary_check_br_table_return (result i32)
      (i32.const 0)
      (block $label0
        (block $label1
          (block $label2
            (br_table $label0 $label1 $label2 (return))
          )
        )
      )
    )
  )
  "type mismatch"
)
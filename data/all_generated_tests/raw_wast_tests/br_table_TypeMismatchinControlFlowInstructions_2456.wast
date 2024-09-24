;; 6. **Test: Nested BrTable Instructions with Outer Misaligned Types**    - **Description**:      Nested `br_table` instructions where the inner one adheres to type constraints but the outer `br_table` has a `label` expecting an `i64` operand but an `i32` is given.    - **Constraint Checked**:      Tests the type checks for nested `br_table` instructions particularly focusing on the outer structure.    - **Related Type Mismatch**:      Misalignment in nested control flow instructions.

(assert_invalid
  (module 
    (func $nested-br-table-misaligned-type (result i32)
      (block (result i64)
        (block 
          (block 
            (br_table 0 1 (i32.const 0) (i32.const 1))
          )
        )
        (br_table 0 0 (i32.const 0) (i64.const 0))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)
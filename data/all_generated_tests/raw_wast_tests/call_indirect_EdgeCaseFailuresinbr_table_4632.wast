;; 1. **Test for Out-of-Bounds Index in `br_table` with Valid `call_indirect`**:    - Generate a `br_table` where the index operand exceeds the number of table targets, following a `call_indirect` that has a valid type match. This tests boundary condition handling in `br_table` against different implementations.    - Constraint: Index in `br_table` is out of bounds.    - Relation: Ensures differential behavior if one implementation mishandles the index boundary.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
      (br_table 1 0 (i32.const 2))
    )
  )
  "out of bounds index in br_table"
)
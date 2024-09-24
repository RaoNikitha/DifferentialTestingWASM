;; 3. **Test Description**: Supply a `br_table` instruction with an index at the exact boundary (i.e., the number of available targets) to confirm proper upper boundary handling. This test ensures that the upper limit is respected without resulting in off-by-one errors.    - **Constraint**: The index provided is equal to the count of targets.    - **Edge Case Relation**: Validates upper boundary condition handling and ensures no off-by-one errors.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $boundary-test (call_indirect (type 0) (i32.const 1) (i32.const 0)))
  )
  "out of bounds table index"
)
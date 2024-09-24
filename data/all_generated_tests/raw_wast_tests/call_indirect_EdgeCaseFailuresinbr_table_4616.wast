;; 5. **Test Description**: Implement a `br_table` instruction where one of the target entries has an incompatible function signature, leading to a type mismatch. This test verifies that type mismatches are correctly trapped.    - **Constraint**: One of the target functions has a different type signature than expected.    - **Edge Case Relation**: Confirms proper dynamic type checking during `call_indirect` execution via `br_table`.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64)))
    (table funcref
      (elem $func1 $func2)
    )
    (func $func1 (param i32) (result i32) (i32.const 0))
    (func $func2 (param f64))
    (func $main (param i32)
      (br_table 0 0 (call_indirect (type 0) (local.get 0)))
    )
  )
  "type mismatch"
)
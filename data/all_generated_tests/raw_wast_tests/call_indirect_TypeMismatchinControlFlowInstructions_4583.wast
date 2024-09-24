;; 2. **Incorrect Return Type in Table Function**:    - Use `call_indirect` to call a function from the table that should return an `i32` but is defined to return a `f64`.    - **Constraint**: Matches the expected return type of the function against the actual return type.    - **Relation**: Verifies that the implementation traps when there is a return type mismatch, ensuring control flow type integrity.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result f64) (f64.const 0))
    (table funcref (elem $f))
    (func $type-mismatch-in-return
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)
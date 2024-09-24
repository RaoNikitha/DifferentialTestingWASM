;; 6. **Conditional Branch with Incorrect Call**:     - Use a `call_indirect` within an `if-else` statement where the condition determines the function type, which is incorrect.     - **Constraint**: The type must be correctly checked within conditional branches.     - **Test Relation**: Confirms that type mismatches within conditional logic are correctly trapped.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param f32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $f (param i32))
    (func $g (param f32))
    (func (param i32)
      (if (result i32)
        (i32.eqz (local.get 0))
        (call_indirect (type 0) (i32.const 1) (f32.const 0.0)) ;; invalid call with wrong type
        (call_indirect (type 1) (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
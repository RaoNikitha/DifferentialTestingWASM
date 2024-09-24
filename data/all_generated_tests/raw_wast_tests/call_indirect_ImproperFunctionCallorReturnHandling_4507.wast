;; 6. **Test Description**: Insert a function into the table that matches the type but use a `call_indirect` that points to an invalid type index.    **Constraint Checked**: Checks type index validation.    **Relation to Improper Handling**: Ensures that invalid type indices do not cause calls to unintended functions.

(assert_invalid
  (module
    (type $sig-valid (func (param i32) (result i32)))
    (type $sig-invalid (func (param i32) (result f64)))
    (table $tab (export "table") 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (type $sig-valid) (param i32) (result i32)
      (local.get 0)
    )
    (func (param i32) (result i32)
      (call_indirect (type $sig-invalid) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)
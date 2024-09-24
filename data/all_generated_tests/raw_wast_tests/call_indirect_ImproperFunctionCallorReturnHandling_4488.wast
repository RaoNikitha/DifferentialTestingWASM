;; 7. **Test Description**: Use `call_indirect` where the function index references a function type that has a different parameter type sequence than the type index, ensuring a type conformity trap.    - **Constraint Checked**: Parameter type conformity.    - **Relation to Improper Handling**: Ensures the parameters expected by the type match those of the function being called.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param f64)))
    (table funcref (elem 0))
    (func (call_indirect (type 0) (i32.const 0) (f64.const 1.0)))
  )
  "type mismatch"
)
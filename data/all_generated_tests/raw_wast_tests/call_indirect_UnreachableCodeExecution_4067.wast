;; 6. **Test Call Indirect to Unreachable Function (Type Mismatch)**:    - **Description**: Define a function expected by call_indirect but deliberately provide a function with an incompatible type that also contains an 'unreachable' instruction.    - **Constraint Checked**: Check type conformity dynamically with the presence of 'unreachable' in mismatched function.    - **Relation to Unreachable**: Ensure a type mismatch correctly aborts execution, trapping before reaching the 'unreachable' instruction.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i32))) 
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (type 1) (unreachable))
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
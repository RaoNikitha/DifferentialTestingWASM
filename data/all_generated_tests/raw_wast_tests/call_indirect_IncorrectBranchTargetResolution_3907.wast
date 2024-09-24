;; 6. **Test Case 6**:    - **Description**: Construct a module using early return with `br` in combination with `call_indirect` within nested function calls, ensuring that the early return correctly resolves function indices before breaking the control flow.    - **Constraint Checked**: Correct functioning of early returns within call sequence.    - **Incorrect Branch Target Resolution**: Ensures that early returns do not misinterpret `call_indirect` target function resulting in premature scope exits.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $inner (param i32) (result i32)
      (br 1 (call_indirect (type $sig) (i32.const 1) (i32.const 0)))
    )
    (func $outer (param i32) (result i32)
      (call_indirect (type $sig) (i32.const 0) (call $inner (i32.const 0)))
    )
    (table funcref (elem $outer))
  )
  "type mismatch"
)
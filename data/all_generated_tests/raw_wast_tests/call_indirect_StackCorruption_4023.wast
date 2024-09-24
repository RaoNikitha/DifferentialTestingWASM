;; 2. **Mismatched Function Type Test**:    - **Description**: Invoke `call_indirect` using a type index that does not match the function signature expected.    - **Constraint Check**: Confirm that a type mismatch trap occurs.    - **Stack Corruption Check**: Ensure the operand stack remains unaffected despite the trap.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $f (param i32) (result i32) (local.get 0))
    (table funcref (elem $f))
    (func $mismatched-type
      (i32.const 0)
      (call_indirect (type $sig2) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
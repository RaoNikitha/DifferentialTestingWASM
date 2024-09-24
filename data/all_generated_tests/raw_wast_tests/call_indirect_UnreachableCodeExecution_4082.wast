;; 1. **Type Mismatch Trap Test**:    - **Description**: Design a function table with both correct and incorrect function types. Use `call_indirect` to call a function with a type that doesn't match the expected type, trapping due to type mismatch.    - **Constraint**: Ensure type conformity is tested by attempting to call a function with mismatched types.    - **Unreachable Code**: If a type mismatch occurs, execution will trap, preventing further code from reaching an 'unreachable' instruction.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result f32)))
    (table 2 funcref)
    (func $func1 (type $sig1) (param i32) (result i32) (local.get 0))
    (func $func2 (type $sig2) (param i32) (result f32) (f32.const 3.14))
    (elem (i32.const 0) $func1 $func2)
    (func (param i32) (result f32)
      (call_indirect (type $sig2) (local.get 0))
    )
  )
  "type mismatch"
)
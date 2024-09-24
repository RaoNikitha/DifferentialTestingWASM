;; 1. **Type Mismatch in Call Arguments**:    - Test a `call_indirect` instruction where the function in the table expects an `i32` and a `f32` argument while the calling site only provides two `i32` values.    - **Constraint**: The function to be called expects matching types for each argument. The test verifies the implementation's ability to trap when the provided arguments do not match the function signature.    - **Relation**: Ensures the correct enforcement of type constraints for function arguments in control flow.

(assert_invalid
  (module
    (func $f (param i32 f32))
    (type $sig (func (param i32 f32)))
    (table funcref (elem $f))
    (func $test
      (call_indirect (type $sig) (i32.const 0) (i32.const 42) (i32.const 0))
    )
  )
  "type mismatch"
)
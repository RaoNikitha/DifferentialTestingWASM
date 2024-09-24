;; 4. **Correct Type, Wrong Signature Test**:    - **Description**: Define functions with a correct type but wrong signature (different number of parameters or return types) and invoke using `call_indirect`, trapping due to a signature mismatch.    - **Constraint**: Test signature conformity based on the function's type.    - **Unreachable Code**: Prevent execution from reaching an 'unreachable' instruction due to a mismatch trap.

(assert_invalid
  (module
    (type (func (param i32 f64)))
    (table 1 funcref)
    (func $correct-type-wrong-signature
      (call_indirect (type 0) (i32.const 0) (i32.const 1) (f32.const 1.0))
    )
  )
  "type mismatch"
)
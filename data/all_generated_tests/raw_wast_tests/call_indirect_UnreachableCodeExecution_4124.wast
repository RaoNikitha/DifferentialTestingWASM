;; 3. **Incorrect Operand Stack Usage Before Unreachable**:    - Test the behavior when the operand stack does not have enough arguments for the function signature required by `call_indirect`, ensuring it results in a trap followed by `unreachable`.    - Confirms correct handling of operand stack conformity prior to encountering unreachable code.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $dummy)
    (func $dummy (param i32 i32) (result i32) (unreachable))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)
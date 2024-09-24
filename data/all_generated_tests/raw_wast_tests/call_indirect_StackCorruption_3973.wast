;; 2. **Test Description**:    A function signature mismatch in `call_indirect`, where the provided operand types do not match the required types of the called function. This will verify if the stack is left in an inconsistent state after trapping.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 0 funcref)
    (func $sig (param i32) (result i32))
    (func $test
      (call_indirect (type 0) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)
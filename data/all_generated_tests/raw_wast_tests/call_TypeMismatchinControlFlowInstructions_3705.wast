;; 4. **Test 4: Call with Excess Arguments**:    - **Test Description**: Call a function with more arguments than it accepts.    - **Constraint**: This test checks that any excess arguments are properly flagged as an error.    - **Type Mismatch**: Excess arguments on the stack should be denied, resulting in a type-related error.

(assert_invalid
  (module
    (func $call-with-excess-arguments (call 0 (i32.const 1) (i32.const 2) (i32.const 3)))
    (func (param i32 i32))
  )
  "type mismatch"
)
;; 5. **Test Name: No-Operation Between Return Values and Function Calls**    - **Description**: Insert `nop` instructions between multiple return values and a subsequent function call.    - **Constraint**: Check for the impact of `nop` on the handling of return values and function call context.    - **Improper Handling Check**: Determines if `nop` affects how return values are handled before being passed to another function.    - **Expected Behavior**: Both implementations should maintain correct return and call sequences.

(assert_invalid
  (module
    (func (result i32 i32)
      (i32.const 1)
      (i32.const 2)
      (nop))
    (func call 1))
  "type mismatch"
)
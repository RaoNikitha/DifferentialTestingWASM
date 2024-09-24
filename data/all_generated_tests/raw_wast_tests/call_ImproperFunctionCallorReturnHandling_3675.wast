;; 4. **Test Mismatch in Return Types**:    - Call a function expecting certain return types but setting the stack with different types before the call.    - **Constraint**: Validating the return types against the function signature.    - **Improper Return Handling**: If return types are not correctly matched, it might cause unsound stack states.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $return-type-mismatch (result i32)
      (call $func-returns-void))
    (func $func-returns-void)
  )
  "type mismatch"
)
;; 3. **Test 3: Call with Extra Arguments**    - Construct a scenario where a call is made to a function with more arguments on the stack than required.    - **Specific Constraint**: Verifies that only necessary arguments are consumed and the excess does not confuse the instruction handling, leading to 'unreachable' execution.    - **Test Relation**: Ensures the function border constraints are respected to prevent 'unreachable' instructions due to stack mismanagement.

(assert_invalid
  (module
    (func $f (param i32 i32) (result i32) (i32.add (local.get 0) (local.get 1)))
    (func (call $f (i32.const 1) (i32.const 2) (i32.const 3))))
  "type mismatch"
)
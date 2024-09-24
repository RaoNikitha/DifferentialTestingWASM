;; 4. **Test Description**: Create multiple functions in a table, some of which execute `unreachable`. Use `call_indirect` with an index that conditionally reaches an `unreachable` function based on runtime values.    - **Constraint Checked**: Proper dynamic type checking to ensure correct function resolution.    - **Unreachable Code Execution**: Tests runtime path decisions to avoid incorrectly reaching `unreachable` instructions.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func (type 0) (param i32) (result i32) (i32.const 1))
    (func (type 1) (unreachable))
    (func (param i32) (call_indirect (type 0) (local.get 0)))
  )
  "type mismatch"
)
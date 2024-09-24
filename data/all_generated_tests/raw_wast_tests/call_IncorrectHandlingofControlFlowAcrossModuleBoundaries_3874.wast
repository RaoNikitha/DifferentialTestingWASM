;; 3. **Cross-Module Call Followed by Local Call from Same Function**:    - **Constraint Checked**: Ensures internal and external call handling within the same function.    - **Description**: Define a function in module A that calls an imported function from module B, followed immediately by a call to another local function in module A. Verify stack consistency and correct flow of execution.

(assert_invalid
  (module
    (import "moduleB" "external_func" (func $external_func (param i32) (result i32)))
    (func $local_func (result i32) (i32.const 42))
    (func (result i32)
      (call $external_func (i32.const 10))
      (call $local_func)
    )
  )
  "type mismatch"
)
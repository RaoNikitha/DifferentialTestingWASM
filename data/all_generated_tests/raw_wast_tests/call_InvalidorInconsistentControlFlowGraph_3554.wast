;; 3. **Test for Excessive Arguments Supplied**:    - **Description**: Provide more arguments on the stack than the called function consumes.    - **Constraint Checked**: Correct number of arguments consumed by function call.    - **CFG Relevance**: Verifies proper stack management and argument consumption in CFG.

(assert_invalid
  (module
    (func $excess-args-call (param i32) (result i32)
      (i32.const 0) (i32.const 1) (call 0)
    )
    (func (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)
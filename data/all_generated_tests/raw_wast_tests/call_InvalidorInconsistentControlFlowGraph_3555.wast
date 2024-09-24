;; 4. **Test for Insufficient Arguments Supplied**:    - **Description**: Provide fewer arguments on the stack than required by the called function.    - **Constraint Checked**: Proper argument stack preparation before function call.    - **CFG Relevance**: Ensures CFG accurately reflects required argument counts for function calls.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (func $insufficient-args (call 0 (i32.const 1)))
  )
  "type mismatch"
)
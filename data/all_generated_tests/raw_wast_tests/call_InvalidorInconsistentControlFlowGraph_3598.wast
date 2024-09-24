;; 7. **Test Description**:    - **Constraint Checked**: Multiple Return Values Not Handled    - **CFG Relevance**: Verifies handling of functions with multiple return values, ensuring proper stack management.    - **Expected Behavior**: Potential mismatch in how multiple returned values are pushed onto the stack, causing errors in handling return values.

(assert_invalid
  (module
    (type (func (result i32 i32)))
    (func $type-multi-ret-vs-num
      (i32.const 1)
      (call 0)
      (i32.eqz)
    )
    (func (result i32 i32) (i32.const 1) (i32.const 2))
  )
  "type mismatch"
)
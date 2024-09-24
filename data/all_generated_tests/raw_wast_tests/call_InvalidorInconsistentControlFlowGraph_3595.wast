;; 4. **Test Description**:    - **Constraint Checked**: Nested Calls with Incorrect Argument Count    - **CFG Relevance**: Tests how nested function calls are handled when the inner function has incorrect argument counts.    - **Expected Behavior**: Should raise an arity mismatch error or type error in Wizard Engine, highlighting issues with the CFG handling nested calls.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $inner (param i32 i32))
    (func $outer
      (call $inner (i32.const 1))
    )
  )
  "type mismatch"
)
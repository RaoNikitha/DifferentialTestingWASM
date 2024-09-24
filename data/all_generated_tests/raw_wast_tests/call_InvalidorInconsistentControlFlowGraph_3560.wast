;; 9. **Test for Function Index as an Operand with Dynamic Value**:    - **Description**: Use a dynamic or computed value as an index for function invocation.    - **Constraint Checked**: Function index lookup and validation at runtime.    - **CFG Relevance**: Checks how CFG deals with dynamic paths and function indexes.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (func $test
      (local $index i32)
      (local.set $index (i32.const 10))
      (call (local.get $index) (i32.const 1) (i32.const 2))
    )
  )
  "function index out of bounds"
)
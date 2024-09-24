;; 9. **Function Call in Try-Catch with Type Mismatch**:    - **Description**: Call a function inside a try-catch block with incorrect argument types provided in the try segment.    - **Reasoning**: Ensures proper validation of argument types within exception handling blocks.    - **Constraint**: Properly raises TypeMismatch errors within try-catch contexts.    - **Relation**: Verifies type consistency within exception handling structures.

(assert_invalid
  (module
    (type $funcType1 (func (param i32)))
    (type $funcType2 (func (param i64)))
    (func $func (type $funcType1) (param i32))
    (func
      try
        (call $func (i64.const 0))
      catch_all
      end
    )
  )
  "type mismatch"
)
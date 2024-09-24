;; 5. **Test Description**:    - Implement a test where `call_indirect` is called within a loop context, expecting the function to return multiple integers while it actually returns multiple floats, resulting in a type mismatch trap on loop exit.    - **Constraint Being Checked**:      - Matching of return types in function calls within looped control structures.    - **Relation to Control Flow Instructions**:      - Verifies that loops and other control constructs handle function return types according to specifications.

(assert_invalid
  (module
    (type $sig (func (result f64 f64)))
    (table 1 funcref)
    (func $callee (type $sig)
      (f64.const 0) (f64.const 1)
    )
    (elem (i32.const 0) $callee)
    (func $caller (result i32 i32)
      (loop 
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
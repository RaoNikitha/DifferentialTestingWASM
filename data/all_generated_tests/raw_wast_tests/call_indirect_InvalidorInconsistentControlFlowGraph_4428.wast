;; 7. **Complex Nested Call with Indirect Tables Test**:    - **Description**: Construct complex nested indirect function calls with `call_indirect` instructions, ensuring valid index and type match but deep nested structure.    - **Constraint**: Validates the nesting and type conformity of deeply nested indirect calls.    - **CFG Relation**: Examines the CFG for proper handling of deeply nested control paths, ensuring no invalid exits or misalignments within the structure.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $nestedFunc (param i32) (result i32)
      (call_indirect (type $sig1)
        (i32.const 0)
        (call_indirect (type $sig2)
          (i32.const 1)
          (i32.const 2)
        )
      )
    )
    (table funcref (elem $nestedFunc))
  )
  "type mismatch"
)
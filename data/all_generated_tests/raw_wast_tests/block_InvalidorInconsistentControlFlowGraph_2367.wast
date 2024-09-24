;; 8. **Misaligned Result Type in Block Instructions**:    - **Test Description**: Construct a block whose resultant stack type after execution differs from the block type’s expected result.    - **Reasoning**: This test ensures that instructions within blocks produce expected results per the block type declaration.    - **Constraint checked**: Result Types Matching    - **Relation to CFG**: Ensures CFG correctly manages the stack alignment with block terminus expectations.

(assert_invalid
  (module 
    (func $misaligned-result-type (result i32)
      (block (result i32)
        (i32.const 1)
        (i32.const 2) 
        (block (result i32)
          (i32.const 3)
          (i32.const 4)
          (i64.add)
        )
      )
    )
  )
  "type mismatch"
)
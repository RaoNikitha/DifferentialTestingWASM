;; 3. **Test 3**:    - **Description**: Create a nested `if` block with function calls at each level, ensuring proper function returns in nested conditions.    - **Constraint**: Check that nested `if` conditions properly manage and propagate function calls and their return values to outer blocks.    - **Relation**: This evaluates the handling of nested `if` structures with function calls and proper return value propagation.

(assert_invalid
  (module (func $nested-if-functions (result i32)
    (if (result i32)
      (i32.const 1)
      (then (if (result i32)
        (i32.const 1)
        (then (call $dummyFunc))
        (else (i32.const 0))
      ) 
      )
      (else (i32.const 2))
    )
  )
  (func $dummyFunc (result i32)
    i32.const 3
  )
  )
  "type mismatch"
)

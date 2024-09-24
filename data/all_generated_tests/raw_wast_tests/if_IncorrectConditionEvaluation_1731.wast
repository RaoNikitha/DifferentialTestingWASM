;; 2. **Complex Condition with Nested `if` blocks**: Develop a test with nested `if` instructions where the inner `if` depends on a complex condition involving multiple stack operations. Ensure the inner branch is correctly taken or not taken based on the condition. Validate if one implementation misinterprets the condition leading to incorrect branching.

(assert_invalid
  (module (func $nested-if-complex-condition (result i32)
    (i32.const 1)
    (if (result i32) (i32.const 1) 
      (then
        (i32.const 0)
        (if (result i32) (i32.const 1)
          (then (i32.const 2))
          (else (i32.const 3))
        )
      )
      (else (i32.const 4))
    )
    (i64.const 1)
  ))
  "type mismatch"
)
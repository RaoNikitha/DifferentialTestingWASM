;; 2. **Test 2: Multiple Nested Returns**    - Define deep nested blocks with multiple `return` instructions at various levels, pushing intermediate results. Verify the final stack remains consistent after reaching the outermost `return`.    - *Related Constraint*: Validates stack state consistency across nested `return` executions.

(assert_invalid
  (module
    (func $nested-returns (result i32)
      (block (result i32)
        (block (result i32)
          (return (i32.const 42)) 
          (i32.const 10)
        )
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)
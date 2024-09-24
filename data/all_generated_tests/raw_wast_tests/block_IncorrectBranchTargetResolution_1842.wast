;; 3. **Nested Block with Multiple Branches**:    - Construct a nested block scenario with multiple blocks and use `br` instructions to target different nesting levels. Verify correct execution and label resolution by checking the final state of the stack.    - **Constraint**: Branch labels should correctly unwind the stack and execute instructions at the target label.    - **Focus**: Ensure that branches can accurately target labels in different nesting levels.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br 2 (i32.const 42))
        )
        (i32.const 1)
      )
    )
  ))
  "type mismatch"
)
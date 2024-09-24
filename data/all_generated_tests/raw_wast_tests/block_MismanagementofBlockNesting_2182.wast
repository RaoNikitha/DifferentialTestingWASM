;; 3. **Branching with Conditional Checks**:    - Develop a test where nested blocks contain `br_if` instructions with conditional checks. Ensure the conditionally executed branches exit the correct block context depending on the evaluation of the condition. Mismanagement of block context may lead to incorrect conditional branch behavior.

(assert_invalid
  (module
    (func $branching_with_conditional_checks (result i32)
      (block (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0)) 
        (i32.add (i32.const 2) (i32.const 3))
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)
;; 5. **Return in Conditional Branches**:    - Create a function with complex conditional branches, where each branch ends with a `return` statement. This test checks if the CFG is able to handle multiple branches' control flow and correctly exits the function at each `return`.

(assert_invalid
  (module
    (func $return-in-conditional-branches (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (return (i32.const 10))
        )
        (else
          (return (i32.const 20))
        )
      )
    )
  )
  "type mismatch"
)
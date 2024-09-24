;; 10. **Test `if` Resolution Within Function Calls**:    Embed an `if-else` construct inside a function. Use `br` instructions within the `if` block that target labels outside the function's scope. Validate correct handling at function boundaries.    - **Constraint**: Ensure branch instructions respect function scope without mis-resolving to external labels.    - **Expectation**: Targets should correctly respect function encapsulation and defined boundaries.

(assert_invalid
  (module
    (func $test 
      (block $lbl_1 
        (i32.const 1) 
        (if (result i32) 
          (then 
            (br $lbl_1 (i32.const 0))
          )
          (else 
            (i32.const 42)
          )
        )
      )
    )
  )
  "type mismatch"
)
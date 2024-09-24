;; 5. **Test Description**: Nest multiple `if` instructions involving calls to both imported and local functions. Validate that the correct path is taken and the final result matches expected values.    - **Constraint Checked**: Accurate execution path and result matching in nested control flow across module calls.    - **Test Relation**: Checks for correct nesting and branching when functions span multiple modules.

(assert_invalid
  (module 
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (if (result i32)
        (call $external_func)
        (then 
          (if (result i32)
            (i32.const 1)
            (then (i32.const 2))
            (else (i32.const 3))
          )
        )
        (else 
          (call $external_func)
        )
      )
    )
  )
  "type mismatch"
)
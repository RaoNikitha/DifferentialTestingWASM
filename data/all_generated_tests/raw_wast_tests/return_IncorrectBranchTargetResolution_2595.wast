;; 4. **Test Description**:    Develop a function that contains both `if-else` conditional blocks with branches and a `return` statement inside one condition. The test verifies if `return` properly targets the function's outermost block without being influenced by the conditional branches.    - **Specific Constraint**: Ensures `return` operates independently of conditional branches.    - **Incorrect Branch Target Resolution**: Prevents incorrect branching within conditionals.

(assert_invalid
  (module
    (func $test_func (param i32) (result i32)
      (local i32)
      (if (local.get 0)
        (then
          (return)
        )
        (else
          (i32.const 1)
        )
      )
      (i32.const 2)
    )
  )
  "type mismatch"
)
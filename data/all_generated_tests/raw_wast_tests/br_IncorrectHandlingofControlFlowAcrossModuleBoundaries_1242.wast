;; 3. **Test Description:**    - Import a function containing an `if` statement with a `br` within the `then` branch.    - Ensure that when calling the imported function, the branch correctly resumes execution after the `end` of the `if` statement.    - **Constraint:** Check for proper control flow and stack unwinding when handling conditional branches across modules.

(assert_invalid
  (module
    (func $imported_func (param i32) (result i32)
      (block (result i32)
        (if (result i32) (i32.ne (local.get 0) (i32.const 0))
          (then (br 0))
          (else (i32.const 0))
        )
        (i32.const 1)
      )
    )
    (func $test_func (result i32)
      (call $imported_func (i32.const 1))
    )
  )
  "type mismatch"
)
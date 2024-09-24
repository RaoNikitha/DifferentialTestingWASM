;; 3. **Test Description 3:**    - **Focus:** Unwinding operand stack before calling an exported function.    - **Constraint:** Verify that operand stack unwinding is correctly implemented when branching to a label and then transitioning to an exported function.    - **Incorrect Handling:** Incorrect operand stack state leading to possible stack corruption.

(assert_invalid
  (module
    (func $exportedFunc (export "foo") (result i32)
      (i32.const 42)
    )
    (func
      (block (result i32)
        (i32.const 10)
        (br 0)
        (call $exportedFunc)
      )
    )
  )
  "type mismatch"
)
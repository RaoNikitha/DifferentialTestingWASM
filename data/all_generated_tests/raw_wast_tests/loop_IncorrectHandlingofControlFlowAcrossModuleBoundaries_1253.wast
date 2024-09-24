;; 4. **Loop with Return from Imported Function**:    - Test a loop that calls an imported function, which in turn executes a return instruction. Verify that the return correctly unwinds the loop stack and returns to the loop’s caller.    - **Constraint**: Checks correct management of return sequence and stack unwinding across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test
      (loop (result i32)
        (call $external_func)
        (return)
      )
    )
  )
  "type mismatch"
)
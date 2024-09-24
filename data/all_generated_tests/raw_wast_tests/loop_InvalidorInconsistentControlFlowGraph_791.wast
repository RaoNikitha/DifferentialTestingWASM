;; 2. **Loop with Unreachable Code Section**:     - **Description**: Create a loop with an instruction sequence that includes an unreachable code section. This unreachable section should be validated to test the proper management of unreachable code within loops.     - **Constraint**: Ensuring loops correctly handle unreachable code segments.     - **CFG Impact**: Unreachable code should not affect the validation of the loop's CFG but may do so if label handling is flawed.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (unreachable)
        (i32.const 42)
      )
    )
  )
  "unreachable code"
)
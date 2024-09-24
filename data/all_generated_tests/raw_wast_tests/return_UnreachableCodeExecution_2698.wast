;; 7. **Multiple Returns in Sequence With Final Unreachable**:    - Create a function with multiple consecutive `return` instructions, ending the sequence with `unreachable`.    - This tests the consistent unwinding and termination behavior of multiple stacked `return` invocations to prevent hitting `unreachable`.

(assert_invalid
  (module
    (func $multiple-returns-with-unreachable (result i32)
      (return)
      (return)
      (unreachable)
    )
  )
  "type mismatch"
)
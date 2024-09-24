;; 9. **Test improper label index decrement while exiting multiple nested blocks with incorrect outermost jumps**:    - **Constraint Checked**: Ensures label index calculations as blocks exit.    - **Reasoning**: Exiting multiple nested blocks while jumping internally tests block exit label adjust handling.

(assert_invalid
  (module (func $test-improper-label-index (result i32)
    (block (result i32)
      (block
        (block
          (br 2)
        )
      )
      (i32.const 1)
    )
  ))
  "label index out of bounds"
)
;; 5. **Unreachable Code after Branching**:    - **Test Description**: Design a block where some instructions become unreachable due to a preceding branch instruction returning control before the `end`.    - **Reasoning**: This test verifies if the implementation can correctly identify and handle unreachable code paths.    - **Constraint checked**: Structured Control Flow    - **Relation to CFG**: Ensures the CFG does not incorrectly account for unreachable paths.

(assert_invalid
  (module 
    (func $test-unreachable-code (result i32)
      (block (result i32) 
        (br 0 (i32.const 42)) 
        (i32.const 0) 
        (unreachable)
      )
    )
    "unreachable code"
  )
)
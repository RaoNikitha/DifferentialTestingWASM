;; 7. **Test Description**: A sequence where nested loops contain inner loop instructions that incorrectly break to an `unreachable` instruction by misreading a branch loop escape to the outer loop:    - **Constraint Checked**: Nested loop handling and correct branch escape interpretation.    - **Unreachable Code Execution**: Misinterpretation of branch escape leads to unintended `unreachable` code execution.

(assert_invalid
  (module
    (func $nested-loops-with-unreachable
      (loop (result i32)
        (loop (result i32)
          (br 1) 
          (unreachable)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
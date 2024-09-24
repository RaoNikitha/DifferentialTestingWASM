;; 10. **Test Description:**    - Design a WebAssembly module where `unreachable` is placed after several chained conditional checks using `br_if`. Each conditional check leads to a trap point based on specific evaluation results. Validate the correct condition checks are executed.    - Constraint: Sequential and dependent condition checking.    - Relation to Incorrect Condition Evaluation: Checks position tracking and correct execution of chained conditions leading to `unreachable`.

(assert_invalid
  (module (func $test-chained-conditional-unreachable
    (block
      (block
        (block
          (br_if 0 (i32.eqz (i32.const 0)))        
          (br_if 1 (i32.eqz (i32.const 1)))
          (br_if 2 (i32.eqz (i32.const 1)))
          (unreachable)
        )
        (unreachable)
      )
      (unreachable)
    )
  ))
  "type mismatch"
)
;; 10. **Test Description**: A `br_table` embedded within an `if` statement with branch indices that mix correct and incorrect targets based on different conditions, testing if conditional branches cause misresolved label indices during execution.

(assert_invalid
  (module (func $conditional_mixed_targets
    (block (block (result i32)
      (if (result i32) (i32.const 1)
        (then (block (br_table 1 2 3 (i32.const 2))))
        (else (block (br_table 0 0 4 (i32.const 0)))))
    ))
  ))
  "unknown label"
)
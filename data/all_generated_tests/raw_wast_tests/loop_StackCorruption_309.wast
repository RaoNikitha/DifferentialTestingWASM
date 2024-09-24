;; 10. **Simulating Stack Overflow**: Design a loop with a theoretically unbounded growth pattern, simulating stack overflow conditions through heavy recursive calls or deep nesting. This stress test reveals if `Wizard Engine` can gracefully handle or prevent stack overflow conditions while managing operand stacks.

(assert_invalid
  (module (func $simulate-stack-overflow
    (result i32)
    (i32.const 1)
    (loop (result i32)
      (i32.const 1)
      (call 0)
    )
  ))
  "recursion depth exceeded"
)
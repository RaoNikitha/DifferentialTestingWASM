;; 7. **Stack Underflow Error in Loop:**    - Test Condition: Implement a loop with an `if` condition that erroneously underflows the stack.    - Constraint: Verify stack management correctness and proper error handling.    - Relevance: Detects discrepancies that could prevent proper loop exits due to stack issues.

(assert_invalid
  (module
    (func $stack-underflow-loop
      (loop (if (i32.eq (i32.const 1) (i32.const 1))
          (then (i32.add (i32.const 1) (local.get 0)))
          (else (br 0)))
      )
    )
  )
  "type mismatch"
)
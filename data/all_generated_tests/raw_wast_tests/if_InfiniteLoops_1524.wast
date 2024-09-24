;; 5. **Loop with Else Condition:**    - Test Condition: Create a loop where an `if` with an `else` branch alternates control flows.    - Constraint: Evaluate both branches and ensure structured control flow and stack consistency.    - Relevance: Ensures that `else` branches propagate control correctly within infinite loops.

(assert_invalid
  (module (func $loop-with-else
    (block (loop
      (if (result i32) (i32.const 1)
        (then (br 1))
        (else (i32.const 0))
      )
    )))
  ))
  "type mismatch"
)
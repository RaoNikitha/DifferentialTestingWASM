;; 4. **Incorrect Execution Flow on Loop Restart**:    Implement a loop with conditions inside a nested loop, then use `br` to re-initialize the outer loop.    This confirms if branching results in correct reinitialization and restarting of loop execution.

(assert_invalid
  (module (func $nested-loop-test 
    (loop $outer (block (loop $inner
      (br $outer) end))))
  )
  "type mismatch"
)
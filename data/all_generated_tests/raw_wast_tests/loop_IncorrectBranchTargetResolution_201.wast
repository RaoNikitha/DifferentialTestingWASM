;; 2. **Conditional Break in Nested Loop**    - Test a nested loop where a `br_if` conditionally branches to the outer loop. This checks if the outer loop restarts correctly and uses correct label indexing for conditional branches.

(assert_invalid
  (module (func $nested-conditional-break (result i32)
    (loop $outer (result i32)
      (loop $inner (result i32)
        (i32.const 1) 
        (br_if $outer (i32.const 0))
        (unreachable)
      )
    )
  ))
  "type mismatch"
)
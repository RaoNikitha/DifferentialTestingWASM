;; 9. **Loop with Complex Calculation in If Condition:**    - Test Condition: Use a calculation-heavy `if` condition inside a loop that can lead to different execution paths.    - Constraint: Ensure that complex conditions are evaluated correctly and stack is managed.    - Relevance: Examines if calculation errors in conditions can lead to infinite loops.

(assert_invalid
  (module (func $complex-condition-in-loop (result i32)
    (loop (result i32) 
      (if (result i32) 
        (i32.add (i32.const 1) (i32.const 2)) 
        (then (i32.const 1)) 
        (else (br 0 (i32.const 1)))
      )
    )
  ))
  "type mismatch"
)
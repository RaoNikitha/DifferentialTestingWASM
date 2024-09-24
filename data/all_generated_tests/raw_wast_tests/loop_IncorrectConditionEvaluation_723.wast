;; 4. **Test Description**: A loop with a counter and a condition in `br_if` that branches only when the counter reaches a specific value. Verify the loop exits at the correct iteration.    - **Constraint**: Tests if the `br_if` condition correctly tracks and evaluates the counter variable.    - **Differential Behavior**: Loop continues indefinitely or breaks out prematurely due to incorrect counter condition evaluation.

(assert_invalid
  (module (func $test-loop-counter (result i32)
    (i32.const 0) 
    (loop (result i32) 
      (i32.const 1) 
      (i32.add) 
      (i32.const 10) 
      (i32.eq)
      (br_if 1)
    )
  ))
  "type mismatch"
)
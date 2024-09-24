;; - **Test 2**:    Generate a loop with a condition that theoretically should break the loop after a certain number of iterations but ensure there is a small miscalculation in the branch condition leading it to never exit.     Constraint: Miscalculation in `br_if` condition.     Relation: This can show if the `br_if` is properly validating the condition and exiting the loop.

(assert_invalid
  (module
    (func $test-loop-condition-miscalculation (result i32)
      (i32.const 5)  ;; initial value
      (loop (result i32)
        (i32.const -1)
        (i32.add)  ;; decrement
        (dup)  ;; duplicate the top of the stack
        (i32.const 0)
        (i32.eq)  ;; check if the top of the stack is zero
        (br_if 1)  ;; if zero, break to end the loop
      )
    )
  )
  "type mismatch"
)
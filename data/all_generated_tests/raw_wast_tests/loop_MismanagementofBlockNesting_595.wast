;; 6. **Forward and Backward Branching in Nested Contexts**:    - Test Description: Implement a case where nested loops involve both backward (to restart a loop) and forward branches (`br_table`) to various depths.    - Constraint: Focus on correct stack unwinding and branch target resolution ensuring accurate control flow transitions.    - Relation: This test checks for errors in multiple direction branching within nested loops, challenging the implementation’s consistency in handling labels.

(assert_invalid
  (module
    (func $nested_forward_backward
      (loop $outer (param i32) (result i32)
        (block $inner
          (br 1) ;; forward branch to outer loop
          (loop $inner_loop
            (br 0) ;; backward branch to inner loop start
            (i32.const 1) ;; Ensure something is on the stack
          )
        )
      )
    )
  )
  "type mismatch"
)
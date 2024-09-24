;; 8. **Test: Control Flow within a Loop**    - **Description:** Embed a `br_table` inside a loop and test with various operand values during iterations.    - **Constraint:** Ensures control flow integrity within loops with complex branching.    - **Relation to Stack Corruption:** Ensures stack is properly managed and unwound during loop iterations with indirect branching.

(assert_invalid
  (module (func $loop-control-flow
    (loop $start (result i32)
      (block $default
        (br_table $default $start (i32.const 7))
      )
    )
  ))
  "type mismatch"
)
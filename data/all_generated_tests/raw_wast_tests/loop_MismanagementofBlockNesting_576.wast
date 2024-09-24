;; 7. **Operand Stack Misalignment with Nested Loop and br_table**:    Implement a scenario where nested loops with different operand stack heights are targeted by a `br_table`.    This checks for correct stack alignment and handling during indirect branching within nested loops.

(assert_invalid
  (module
    (func $nested-loop-br_table
      (i32.const 1)
      (i32.const 0)
      (loop (result i32)
        (loop (result i32)
          (br_table 0 1)  ;; Indirect branch to either inner or outer loop
        )
        (drop)
      )
      (drop)
    )
  )
  "type mismatch"
)
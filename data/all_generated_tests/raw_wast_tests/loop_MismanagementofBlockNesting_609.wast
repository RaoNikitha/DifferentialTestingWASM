;; 10. Develop a nested loop structure where each loop uses a different type of branch instruction (unconditional `br`, conditional `br_if`, and indirect `br_table`). Ensure branches correctly manage operand stacks and labels, properly resolving depths within nested loops.

(assert_invalid
  (module
    (func $nested_loops
      (result i32)
      (i32.const 1)
      (loop (param i32)
        (br_if 0 (i32.const 0))  ;; inner loop 1 with br_if
        (loop (param i32)
          (br 1))  ;; inner loop 2 with br
        (loop (param i32)
          (block (br_table 0 1 (i32.const 2)))) ;; inner loop 3 with br_table
      )
    )
  )
  "type mismatch"
)
;; 6. **Test Input: Deeply Nested Loop Structures**    - Description: Test a sequence with deeply nested loops involving correct label targeting with `br`, `br_if`, and `br_table`.    - Constraint: Validate accurate label resolution in highly nested loop structures.    - Focus: Test differential behavior when handling nesting depth exceeding common usages.

(assert_invalid
  (module
    (func $deeply_nested_loops
      (loop (result i32)
        (loop (result i32)
          (loop (result i32)
            (loop (result i32)
              (i32.const 0)
              (br 3)  ;; branching to the outermost loop
              (loop (result i32)
                (i32.const 1)
                (br_if 2 (i32.const 0))  ;; conditionally branching to the second outer loop
                (loop (result i32)
                  (i32.const 2)
                  (br_table 1 0 (i32.const 3))  ;; indirect branching
                )
              )
            )
          )
        )
      )
    )
  )
  "incorrect label handling"
)
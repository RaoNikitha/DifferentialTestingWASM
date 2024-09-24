;; 6. Test a deeply nested loop structure with mixed conditional branches (`br_if`) inside multiple nested `if` blocks. Check if branches targeting different levels of the nested blocks are correctly interpreted, ensuring proper reinitialization within the nested loops.

(assert_invalid
  (module
    (func $deeply_nested_loops
      (loop $outer (result i32)
        (i32.const 1)
        (loop $inner (result i32)
          (i32.const 2)
          (if (i32.eqz (i32.const 0))
            (br_if 1 (i32.const 3)) ;; branch to $outer
            (if (i32.eqz (i32.const 1))
              (br_if 0 (i32.const 4)) ;; branch to $inner
            )
          )
          (i32.const 5)
        )
      )
    )
  )
  "type mismatch"
)
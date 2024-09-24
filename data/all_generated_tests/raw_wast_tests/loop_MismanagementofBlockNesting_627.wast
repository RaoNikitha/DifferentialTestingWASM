;; 8. **Multi-Depth Branching Variance**: Use multiple levels of nested loops with branches (`br` and `br_if`) that reference different depths of nested loops. This test ensures that branches correctly target the intended loop depths and do not misdirect flow control to improper loop layers.

(assert_invalid
  (module
    (func $multi-depth-loop-branching
      (loop (result i32)
        (i32.const 0)
        (loop (result i32)
          (i32.const 1)
          (br 1) ;; Branch to outer loop
        )
        (br 1) ;; Branch to function start, invalid
      )
    )
  )
  "type mismatch or improper branch"
)
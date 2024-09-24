;; Test 2: Design a loop with multiple nested loops where an inner loop uses `br` to branch to an outer loop, ensuring that label indexing and context are extended and managed correctly.

(assert_invalid
  (module
    (func (param i32)
      (loop (param i32) (result i32)
        (i32.const 0)
        (loop (param i32) (result i32)
          (br 1)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)
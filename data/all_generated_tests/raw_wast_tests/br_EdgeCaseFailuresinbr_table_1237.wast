;; - Test 8: Execute a `br_table` inside a large loop where the index grows beyond the loop’s iteration count, ensuring that the implementation does not mismanage control flow in extended run loops.

(assert_invalid
  (module
    (func $br_table_loop_large
      (loop $outer (result i32)
        (loop $inner (result i32)
          (br_table 0 1 2 3 4 (local.get 0)) (local.get 0)
        )
      )
    )
  )
  "unknown label"
)
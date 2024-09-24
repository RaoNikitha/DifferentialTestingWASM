;; Write a test with a loop that increments a counter and calls `return` when the counter hits a specific value. If the `return` doesn't exit the loop correctly, the loop should run indefinitely, revealing implementation errors.

(assert_invalid
  (module
    (func $loop-with-return 
      (local i32)
      (block
        (loop
          (local.get 0)
          (i32.const 5)
          (i32.eq)
          (if (then (return)))
          (local.get 0)
          (i32.const 1)
          (i32.add)
          (local.set 0)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
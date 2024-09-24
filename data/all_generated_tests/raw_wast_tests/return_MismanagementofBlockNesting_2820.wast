;; 9. **Loop Counter Controlled Exit**: Create a loop within a function that uses a counter and conditionally performs a `return` when a specific counter value is hit. Place nested blocks and assert correct stack unwinding respecting both loop and block boundaries.

(assert_invalid
  (module
    (func $loop-counter-controlled-exit
      (result i32)
      (local i32)
      (local.set 0 (i32.const 10))
      (block
        (loop
          (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
          (br_if 1 (i32.eq (local.get 0) (i32.const 5)))
          (br 0)
        )
        (return (i32.const 1))
      )
    )
  )
  "type mismatch"
)
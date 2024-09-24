;; 5. Implement a function that enters a loop with an accumulating sum. Place a conditional `return` based on the sum value inside the loop. Test if the sum condition can correctly lead to a `return` and exits the loop appropriately.

(assert_invalid
  (module
    (func $sum-loop-return (param i32) (result i32)
      (local i32)
      (loop
        (local.set 0 (i32.add (local.get 0) (i32.const 1)))
        (if (i32.eq (local.get 0) (i32.const 5))
          (return (local.get 0))
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)
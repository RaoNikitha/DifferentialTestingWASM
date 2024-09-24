;; 5. Create a nested loop where the inner loop contains a `br_if` condition dependent on a parameter passed from the outer loop. This verifies that condition evaluation correctly handles contextual changes across nested loops.

(assert_invalid
  (module 
    (func $nested-loop (param i32) (result i32)
      (local i32) 
      (loop $outer 
        (local.set 1 (local.get 0)) 
        (loop $inner 
          (br_if $outer (local.get 1))
        )
      )
    )
  )
  "type mismatch"
)
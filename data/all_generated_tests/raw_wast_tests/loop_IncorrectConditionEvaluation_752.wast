;; 3. Implement a loop with a counter that increments on each iteration. Use a `br_if` condition to exit the loop when the counter hits a certain value. This checks if the condition evaluation properly respects changes in local variables within the loop body.

(assert_invalid
  (module
    (func $loop_with_br_if (param $count i32) (result i32)
      (local $n i32)
      (set_local $n (i32.const 0))
      (loop $loop 
        (set_local $n 
          (i32.add (get_local $n) (i32.const 1))
        )
        (br_if $loop 
          (i32.lt_s (get_local $n) (get_local $count))
        )
      )
      (get_local $n)
    )
  )
  "type mismatch"
)
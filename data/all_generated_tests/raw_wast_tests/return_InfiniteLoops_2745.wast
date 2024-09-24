;; 4. **Loop with Increments and Conditional Return**: Create a function where a loop increments a counter and conditionally calls `return`. Ensure the loop exits correctly upon reaching a certain value, where improper operand stack checks could cause an infinite loop if the return condition is mishandled.

(assert_invalid
  (module
    (func $loop_inc_cond_return
      (local i32)
      (loop 
        (local.get 0)
        (i32.const 1)
        (i32.add)
        (local.set 0)
        (local.get 0)
        (i32.const 10)
        (i32.eq)
        (br_if 1 (return))
        (br 0)
      )
    )
  )
  "type mismatch"
)
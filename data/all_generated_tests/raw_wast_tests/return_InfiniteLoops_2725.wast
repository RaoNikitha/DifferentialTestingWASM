;; Create a loop that conditionally returns based on a parameter value. If the parameter value is never updated correctly within the loop, it should lead to an infinite loop. This tests if `return` properly exits the function.

(assert_invalid
  (module
    (func $conditional-return-in-loop (param $x i32) (result i32)
      (local $i i32)
      (loop $loop
        (local.get $x)
        (if (result i32)
          (i32.eqz)
          (then (return (i32.const 0)))
          (else
            (local.set $i (i32.add (local.get $i) (i32.const 1)))
            (br $loop)
          )
        )
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)
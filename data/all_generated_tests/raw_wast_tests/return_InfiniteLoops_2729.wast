;; Create a recursive function that involves a loop with a conditional `return`. The loop should continue indefinitely if `return` is not correctly handled by the recursion, revealing stack management issues.

(assert_invalid
  (module
    (func $test_loop (result i32)
      (local $counter i32)
      (local.set $counter (i32.const 0))
      (loop $loop
        (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
        (if (i32.eqz (i32.rem_u (local.get $counter) (i32.const 10)))
          (then (return))
        )
        (br $loop)
      )
    )
  )
  "type mismatch"
)
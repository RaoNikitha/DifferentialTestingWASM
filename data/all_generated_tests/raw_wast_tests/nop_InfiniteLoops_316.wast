;; 7. Construct a `loop` involving local variable updates and a `br_if` based on the variable state. Use `nop` after the update to ensure it doesn't inadvertently affect the exit condition leading to loop continuation.

(assert_invalid
  (module
    (func $test_loop
      (local $i i32)
      (local.set $i (i32.const 0))
      (loop $loop
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        nop
        (br_if $loop (i32.lt_u (local.get $i) (i32.const 5)))
      )
    )
  )
  "type mismatch"
)
;; 1. Create a loop that should exit when a counter reaches 10. Use the `br_if` instruction to break out of the loop conditionally based on the counter. Given incorrect handling of operand stack, the loop could fail to exit properly, leading to an infinite loop.

(assert_invalid
  (module
    (func $test_loop
      (local $counter i32)
      (loop $loop
        (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
        (br_if $loop (i32.ne (local.get $counter) (i32.const 10)))
      )
    )
  )
  "type mismatch"
)
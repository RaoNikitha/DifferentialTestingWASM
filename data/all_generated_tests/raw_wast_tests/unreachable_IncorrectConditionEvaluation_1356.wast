;; 7. Build a loop that runs twice with an `i32.add` operation and uses `br_if` to exit prematurely based on a false condition. Place `unreachable` after `br_if` inside the loop. The test identifies if the loop runs improperly due to condition errors, leading to the trap.

(assert_invalid
  (module (func $test_loop_unreachable_br_if
    (loop
      (i32.add (i32.const 1) (i32.const 2))
      (br_if 0 (i32.const 0))
      (unreachable)
    )
  ))
  "type mismatch"
)
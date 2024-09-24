;; 6. Construct a nested loop scenario where the inner loop contains an `unreachable` instruction and the outer loop checks an `increment` variable. Trigger the inner loop’s `unreachable` based on a condition to see if the outer loop correctly terminates without running indefinitely.

(assert_invalid
  (module (func $nested-loops-with-unreachable
    (loop
      (i32.const 0)
      (loop
        (br_if 1 (i32.eq (get_local 0) (i32.const 1)))
        (unreachable)
      )
      (i32.add (get_local 0) (i32.const 1))
    )
  ))
  "type mismatch"
)
;; 1. Test an `unreachable` instruction placed at the end of a function's main body after several arithmetic operations to see if both implementations trap as expected. This checks how consistently each handles reaching `unreachable` after a valid sequence.

(assert_invalid
  (module
    (func $test-unreachable-end
      (i32.const 42)
      (i32.const 8)
      (i32.add)
      (i32.const 3)
      (i32.mul)
      (unreachable)
    )
  )
  "type mismatch"
)
;; Create a loop that terminates with an `unreachable` instruction and contains branches that should cause the loop to re-enter, ensuring the CFG correctly handles paths leading to unreachable code.

(assert_invalid
  (module
    (func $test_loop (result i32)
      (local $x i32)
      (loop (result i32)
        (i32.const 0)
        (br_if 0 (i32.lt_s (local.get $x) (i32.const 10)))
        (unreachable)
      )
    )
  )
  "type mismatch"
)
;; Test 3: Use an `unreachable` instruction inside a `loop` followed by normal operations like `i32.const 1` inside and outside the loop. This checks if the loop gets terminated immediately.

(assert_invalid
  (module
    (func $loop_unreachable (result i32)
      (block
        (loop
          (unreachable)
          (i32.const 1)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
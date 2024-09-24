;; Design a `loop` instruction with a compound `if` condition inside the `loop` body. Use `br_if` to branch if the condition is met. Push `1` and ensure the branch correctly evaluates.

(assert_invalid
  (module
    (func $test (result i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (drop)
      )
    )
  )
  "type mismatch"
)
;; 2. Design a test with nested `if` instructions where the inner `if` block contains an `unreachable` instruction. Verify that valid execution never reaches the inner `if` and does not perform any unintended stack unwinding.

(assert_invalid
  (module
    (func $nested-if-with-unreachable
      (block
        (if (i32.const 1)
          (then
            (if (i32.const 0)
              (then
                unreachable
              )
            )
            (i32.const 0)
          )
        )
      )
    )
  )
  "unreachable code"
)
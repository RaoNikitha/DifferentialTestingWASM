;; Design a scenario with an `if` statement inside a `loop`, where the `br` instruction targets the loop label from within the `if` statement. Verify that the loop correctly continues execution from the beginning. Testing for: Correct handling of backward branches in nested control flow, ensuring loops reset correctly without breaking structured control flow.

(assert_invalid
  (module
    (func $test
      (loop
        (if (i32.eqz (i32.const 0)) (then (br 1)))
      )
    )
  )
  "invalid label"
)
;; Construct a test with an `if-else` block followed by several `block` instructions, and place a `br` instruction targeting the `else` branch label (`label 1`). Confirm the branch target correctly references the `else` branch, maintaining proper control flow.

(assert_invalid
  (module
    (func $test 
      (block
        (block
          (if (i32.const 1)
            (then
              (i32.const 1)
            )
            (else
              (br 1)
            )
          )
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)
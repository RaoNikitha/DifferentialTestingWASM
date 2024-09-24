;; 10. **Unreachable After Conditional Loop Return**:    - Develop a conditional loop where an early `return` exits the loop and ensure any remaining statements set containing an `unreachable` instruction are not executed.    - This checks the behavior of conditional looping structures and validates no unexpected continuation to `unreachable`.

(assert_invalid
  (module
    (func $conditional-loop-with-return
      (block
        (loop
          (i32.const 1)
          (if (result i32)
            (then (return))
            (else (unreachable))
          )
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)
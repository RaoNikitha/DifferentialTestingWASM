;; 4. Test return from a loop with intermediate values:    - Implement loops that perform calculations and use the `return` instruction within the loop.    - Check if the function terminates correctly, returns the expected result, and maintains the correct stack state.

(assert_invalid
  (module
    (func $type-return-in-loop (result i32)
      (i32.const 42)
      (loop (result i32)
        (i32.add) 
        (return)
      )
    )
  )
  "type mismatch"
)
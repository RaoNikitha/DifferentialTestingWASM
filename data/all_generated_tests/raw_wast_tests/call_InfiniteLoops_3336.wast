;; 5. **Test 5: Loop with Conditional `br` After Function Call**    - **Constraint:** Correct evaluation of `br` instructions post function call.    - **Description:** In a loop, place a function call followed by a `br` instruction that should exit the loop. Misinterpreting the branch condition should result in an infinite loop.

(assert_invalid
  (module
    (func $loop-function-call
      (loop $label
        (call 1)
        (br 1)
      )
    )
    (func (result i32))
  )
  "type mismatch"
)
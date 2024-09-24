;; 8. **Test with Loop Within Conditional**    - **Description**: Create a conditional construct encapsulating a loop, then place a `return` instruction inside the loop which in turn is inside the conditional block.    - **Constraint**: This test validates if the `return` recognizes the function boundary instead of mistakenly targeting the loop block.

(assert_invalid
  (module
    (func $loop-within-conditional (result i32)
      (if (i32.const 1)
        (then
          (loop
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)
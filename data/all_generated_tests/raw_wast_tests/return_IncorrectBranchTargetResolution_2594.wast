;; 3. **Test Description**:    Design a function with an inner loop that contains a `return` instruction. Place multiple `br` (branch) instructions before the `return`. This test checks if `return` can escape both the loop and any other enclosing constructs, ensuring the function returns to the correct caller context.    - **Specific Constraint**: Ensures `return` instruction exits the function context, ignoring loops.    - **Incorrect Branch Target Resolution**: Validates that the `return` instruction does not mistakenly jump to labels within loops.

(assert_invalid
  (module
    (func $inner-loop-with-return
      (block
        (loop
          (br 1)
          (return)
        )
      )
    )
    (export "innerLoopReturn" (func $inner-loop-with-return))
  )
  "type mismatch"
)
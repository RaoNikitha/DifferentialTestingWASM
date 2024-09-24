;; 9. **Clearing Intermediate Stack Values**:    - Import and call a function that pushes intermediate values onto the stack before returning. Ensure that the `return` instruction discards these values correctly.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (i32.const 42)
      (i32.const 13)
      (return)
    )
  )
  "type mismatch"
)
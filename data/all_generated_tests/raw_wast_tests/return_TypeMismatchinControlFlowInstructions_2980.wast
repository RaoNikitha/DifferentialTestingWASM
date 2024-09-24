;; 9. **Test 9 - Implicit Return Value Mismatch**:    - Description: Implement a function with no explicit return but with an implicit return at the end. Change the context so the final returned value does not match the function signature.    - Constraint: Checks how the `return` instruction handles implicit returns and maintains type consistency.

(assert_invalid
  (module
    (func $implicit-return-value-mismatch (result i32)
      (i32.const 42)
      ;; Implicit return here
    )
  )
  "type mismatch"
)
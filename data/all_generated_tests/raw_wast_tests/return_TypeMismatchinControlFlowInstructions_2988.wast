;; 7. **Invalid Return Type in Function Block**: Develop a function that incorrectly returns a `f64` from a block where the function’s return type is `i32`. The test checks how type mismatches are handled by the `return` instruction within the function’s control flow.

(assert_invalid
  (module
    (func $invalid-return-type (result i32)
      (f64.const 1.0)
      (return)
    )
  )
  "type mismatch"
)
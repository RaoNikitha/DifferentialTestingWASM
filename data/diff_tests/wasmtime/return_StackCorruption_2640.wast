;; 9. **Test Calling Imported Function**:    - Write a test where a function calls an imported function that returns values, immediately followed by a `return` instruction in the calling function. Ensure stack handling for cross-function returns is correctly managed by both implementations without corrupting the stack.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $testFunc (result i32)
      (call $externalFunc)
      (return)
    )
  )
  "type mismatch"
)
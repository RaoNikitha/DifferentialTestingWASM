;; 5. **Functon Call After Return With Unreachable**:    - Define a function that performs a `return` and then calls another function containing an `unreachable` instruction.    - This tests the return handling across function calls and ensures no fallthrough to the `unreachable` instruction of the second function.

(assert_invalid
  (module
    (func $func1
      (return)
      (call $func2)
    )
    (func $func2
      unreachable
    )
  )
  "type mismatch"
)
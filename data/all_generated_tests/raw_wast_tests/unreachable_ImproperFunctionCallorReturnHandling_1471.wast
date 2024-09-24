;; 2. **Test 2: Unreachable After Function Return**    - Description: Include an `unreachable` instruction immediately after a function returns a value.       - *Constraint:* Checks that the function return does not bypass the trap caused by `unreachable`.      - *Improper Handling Check:* Ensures the function's return value does not lead to continued execution beyond the `unreachable`.

(assert_invalid
  (module (func $type-func-unreachable-after-return (result i32)
    (return (i32.const 1)) (unreachable)
  ))
  "type mismatch"
)
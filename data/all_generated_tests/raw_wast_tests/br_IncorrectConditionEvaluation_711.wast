;; 2. **Test: Incorrect Condition Handling for `br_if` with Non-Zero Value**    - **Description:** Create a test where a `br_if` instruction evaluates a condition that results in a non-zero value (true). The `br_if` should take the branch, and the control flow should be transferred accordingly.    - **Constraint:** Ensure that the condition is correctly evaluated to a non-zero value, and the `br_if` takes the branch.

(assert_invalid
  (module
    (func $incorrect-br_if (block $label (br_if $label (i32.const 1))))
  )
  "expected type \\i32"
)
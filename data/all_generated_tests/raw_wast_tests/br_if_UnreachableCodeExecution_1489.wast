;; 10. **Test 10**: Create a scenario where `br_if` references a label within an invalid bound (negative index). Follow the `br_if` with an `unreachable` instruction and observe if the code executes the `unreachable` due to failure in label index validation.

(assert_invalid
  (module (func $invalid-label-bound (br_if -1 (i32.const 1)) unreachable))
  "unknown label"
)
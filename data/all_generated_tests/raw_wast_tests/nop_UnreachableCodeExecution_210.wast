;; 1. **Test 1**:     - Description: Create a test sequence where multiple `nop` instructions are followed by an `unreachable` instruction. The goal is to check if the presence of `nop` instructions affect control flow, erroneously leading to the `unreachable` code execution.    - Constraint: Validating that `nop` should not modify the control flow and should not contribute to executing the following `unreachable` instruction.

(assert_invalid
  (module (func $test (nop) (nop) (nop) (unreachable)))
  "unreachable code should not be executed"
)
;; 2. **Test 2: Forward Branch to Unreachable Instruction**    - **Description**: Implement a `block` where a `br` instruction skips over a sequence, including an `unreachable` instruction. Check if the program correctly avoids executing the unreachable code.    - **Constraint**: Verifies that forward branches bypass unreachable instructions without erroneous execution.

(assert_invalid
  (module (func $forward-branch-skips-unreachable
    (block (br 0) (unreachable) end)
  ))
  "type mismatch"
)
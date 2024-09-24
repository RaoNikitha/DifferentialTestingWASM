;; 3. **Test 3: Conditional Branch to Blocks Containing Unreachable**    - **Description**: Use a `br_if` instruction within a `block` conditionally branching to an inner block containing an `unreachable`. Check if the condition is properly evaluated to avoid, or incorrectly enters, the unreachable part.    - **Constraint**: Tests the correctness of conditional branching past unreachable instructions.

(assert_invalid
  (module
    (func $conditional-branch-unreachable
      (block (result i32)
        (block
          (br_if 1 (i32.const 0))
          (unreachable)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
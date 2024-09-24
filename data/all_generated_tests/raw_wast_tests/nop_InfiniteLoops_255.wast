;; 6. **Test Description**: Construct a scenario where a `nop` instruction is inside a loop that contains `br` and another loop, ensuring the outer loop exits using the `br` properly.    - **Constraint**: Ensures `nop` does not alter the outer control structure's branching.    - **Relation to Infinite Loops**: Checks for potential infinite looping if `nop` influences branching in unexpected ways.

(assert_invalid
  (module
    (func (loop (nop) (loop (br 1)) (br 0)))
  )
  "invalid nesting in br target"
)
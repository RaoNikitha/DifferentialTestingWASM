;; 5. **Test Description**:    Write a function with a sequence of nested `block` instructions, each followed by a different branching instruction (`br`, `br_if`, etc.). Place the `return` instruction at the deepest nested level. This test ensures the `return` instruction correctly identifies and targets the actual function block.    - **Specific Constraint**: Confirms correct identification of outermost function block amidst nested containers.    - **Incorrect Branch Target Resolution**: Tests for accurate branch target resolution.

(assert_invalid
  (module
    (func (result i32)
      (block
        (br_if 0 (i32.const 0))
        (block
          (br_if 1 (i32.const 1))
          (block
            (br_if 2 (i32.const 2))
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)
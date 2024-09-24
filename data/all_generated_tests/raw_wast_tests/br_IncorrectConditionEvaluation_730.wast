;; 1. **Test Description:**    - Create a `br_if` instruction within a nested `block` where the condition is always set to false. Manipulate the operand stack to ensure that the `br_if` does not take the branch.    - **Constraint Checked:** Incorrect condition evaluation leading to an invalid branch decision. Ensures condition evaluates correctly even under stack manipulation.    - **Test Relation:** Verifies that the `br_if` instruction properly respects the condition and does not branch incorrectly.

(assert_invalid
  (module
    (func $nested-block-br_if-operand-stack
      (block (result i32)
        (i32.const 42)
        (block (result i32)
          (i32.const 1)
          (br_if 1 (i32.const 0))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)
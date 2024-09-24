;; 8. **Test Description 8:**    - **Focus:** Return from an exported function mid-control structure.    - **Constraint:** Test `br` instruction behavior when branching back to a control structure that spans module boundaries.    - **Incorrect Handling:** Improper return leading to misalignment in control flow or operand stack.

(assert_invalid
  (module
    (func (export "test_fn") (result i32)
      (block (result i32)
        (i32.const 42)
        (block
          (br 1)
          (drop)
        )
        (return)
      )
    )
  )
  "type mismatch"
)
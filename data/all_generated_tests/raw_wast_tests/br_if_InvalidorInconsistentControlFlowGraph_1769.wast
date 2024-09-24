;; 10. **Test Description**: Structure a multi-level nested `block`, `loop`, and `if`, where `br_if` targets intermediate blocks and loops. Validate that each branch adheres to expected target types and correct operand stack state.    - **Constraint Checked**: Multi-depth operand and label target consistency.    - **CFG Relation**: Verifies that the CFG accurately represents and handles multiple nested and intermediate level branches.

(assert_invalid
  (module
    (func $nested-structural
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (loop (result i32)
            (if (result i32)
              (i32.const 1)
              (then
                (br_if 1)
              )
            )
            (i32.const 0) (br_if 1)
          )
        )
      )
    )
  )
  "type mismatch"
)
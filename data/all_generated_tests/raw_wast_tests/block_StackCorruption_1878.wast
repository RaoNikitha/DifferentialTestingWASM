;; 9. **Test Description**: Design a block where the result type of inner blocks is incorrectly assumed by outer blocks, generating variable stack heights that test type correctness and stack state.    - **Constraint**: Ensures that nested blocks enforce and respect result type constraints.    - **Relation to Stack Corruption**: Assuming incorrect block result types can disrupt stack consistency and cause corruption.

(assert_invalid
  (module (func $nested-block-mismatch (result i32)
    (block (result i32)
      (block (result f32) (f32.const 1.0))
      (drop)
      (i32.const 42)
    )
  ))
  "type mismatch"
)
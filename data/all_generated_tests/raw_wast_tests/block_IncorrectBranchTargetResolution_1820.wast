;; 1. **Test Description**: Create a block that contains a branch instruction targeting an outer block, but the branch mistakenly resolves to the inner block due to label miscounting in wizard_engine.    - **Constraint**: Check that the branch correctly jumps to the outer block as labeled.    - **Relation**: This verifies that the label indexing relative to nesting depth is handled correctly.

(assert_invalid
  (module (func $branch-label-miscount (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 42)) (i32.const 1)
      )
    )
  ))
  "type mismatch"
)
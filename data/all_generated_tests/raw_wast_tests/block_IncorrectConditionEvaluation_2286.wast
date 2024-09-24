;; 7. **Nested Conditional Branches**:    - Nest a block with another block containing conditional branches to different labels (`br_if 0`, nested `block`, nested `br_if 1`). Validate label resolution and condition checks.        Constraints: Tests if nested `br_if` instructions evaluate conditions and adjust label indices appropriately.

(assert_invalid
  (module
    (func $nested-block-conditional-branch
      (block (result i32)
        (block (result f32)
          (br_if 0 (i32.const 1))
          (block (br_if 1 (f32.const 1.0)))
        )
      )
    )
  )
  "type mismatch"
)
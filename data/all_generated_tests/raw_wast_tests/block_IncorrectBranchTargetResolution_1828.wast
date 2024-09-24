;; 9. **Test Description**: Develop a nested block scenario where an outer block's branch is incorrectly resolved within an inner block due to miscounted/shifted labels.    - **Constraint**: Validate that an outer block's branch does not interfere with inner block scopes.    - **Relation**: Tests that branches directed outward honor their relative nesting levels.

(assert_invalid
  (module (func $nested-blocks-branch-miscount
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 10))  ;; Incorrectly resolving to the outer block
        (i32.const 20)
      )
      (i32.const 30)
    )
  ))
  "type mismatch"
)
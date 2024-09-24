;; 4. **Test 4: Conditional Branching in Nested Blocks**    - **Description:** Nested blocks with conditional `br_if` instructions comparing different conditions to force branching to different levels of enclosing blocks.    - **Constraint:** Tests conditional control within nested structures.    - **Mismanagement Check:** Validates correct resolution of label indices under conditionally controlled branches.

(assert_invalid
  (module (func $conditional-branch-nested (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (i32.const 0)
          (br_if 0 (i32.const 1)) 
          (br_if 1 (i32.const 0))
        )
        (i32.const 2)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)
;; 10. **Test 10: Loop with Inline Block and Conditional Branches**     - Description: Include a loop with an inline block containing `br_if` instructions. Test if each condition, when true, correctly resolves to the expected label within the loop.     - Constraint: Validates conditional branch target resolution within sub-blocks of a loop.

(assert_invalid
  (module
    (func $test-loop-inline-block-conditional-branches
      (loop (result i32)
        (i32.const 1)
        (block (result i32)
          (br_if 0 (i32.const 0))
          (i32.const 2)
        )
        (drop)
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)
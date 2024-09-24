;; 5. **Branching Out of Nested Blocks to Loop**:    - Description: Define a loop with a nested block that includes a `br` targeting the loop. Verify that the conditional and unconditional branches correctly exit the block and jump back to the loop.    - Reasoning: Tests if branches from nested blocks properly resolve to the outer loop.

(assert_invalid
  (module (func $branch-outside-nested-to-loop
    (loop (result i32)
      (block (result i32)
        (br 1)
        (i32.const 0)
      )
    )
  ))
  "branch to invalid target"
)
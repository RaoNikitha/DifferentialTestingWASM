;; 3. **Nested Loop Leading to Unreachable**:    - **Description**: Create nested loops where a branch from the inner loop (`br 1`) leads to an unreachable instruction in the outer loop.    - **Constraint Checked**: Tests the correct nesting and branch indexing handling within loops.    - **Unreachable Execution Check**: Ensures proper trapping at the unreachable instruction in the context of nested loops.

(assert_invalid
  (module (func $nested-loop-unreachable
    (block
      (loop
        (i32.const 1)
        (br 1)
      )
      (unreachable)
    )
  ))
  "unreachable execution"
)
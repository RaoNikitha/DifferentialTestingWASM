;; 5. **Test 5: Loop with Unreachable Code Paths**    - Description: Include unreachable code paths in a loop, followed by a reachable `br` instruction. Check if the branch correctly skips the unreachable paths and targets the specified loop label.    - Constraint: Tests loop's control flow graph and branch target computation in the presence of unreachable code.

(assert_invalid
  (module (func $loop-unreachable-branch-target
    (loop (result i32)
      (unreachable)
      (br 0)
    )
  ))
  "unreachable code"
)
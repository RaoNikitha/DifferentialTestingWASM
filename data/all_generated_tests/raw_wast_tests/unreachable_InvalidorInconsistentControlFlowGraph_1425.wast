;; Test 6: Use `unreachable` immediately after a `br` (branch) instruction and before another valid instruction. This checks if the branch is considered to reach the following valid code incorrectly.

(assert_invalid
  (module (func $test-branch-after-unreachable
    (block (br 0) (unreachable) (nop))
  ))
  "type mismatch"
)
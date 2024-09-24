;; Sure, here are the 10 unique test descriptions for incorrect branch target resolution based on the provided implementation differences:  1. **Test 1: Incorrect Nested Branch in 'if' Condition Resolution**    - An `if` block nested within another `if` block where a branch inside the inner `if` incorrectly targets the outer `if` block.

(assert_invalid
  (module (func $nested-branch-target (result i32)
    (if (result i32)
      (i32.const 1)
      (then (if (result i32) (i32.const 1) (then (br 1))))
      (else (i32.const 0))
    )
  ))
  "invalid branch target"
)
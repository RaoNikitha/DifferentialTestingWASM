;; Test 1: Create a function with nested blocks using `br_table` where the operand stack has insufficient values to match the expected types for a backward branch, and observe if the branch is correctly handled. The test checks the consistency of operand type matching during a backward branch.

(assert_invalid
  (module (func $insufficient-stack-for-backward-branch
    (block (loop
      (br_table 0 0 (i32.const 0))
      (i32.const 1)
    ))
  ))
  "type mismatch"
)
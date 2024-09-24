;; 8. **Loop within a block across modules**:    - Implement a loop within a block that calls an imported function on each iteration.    - Validate that control flow returns accurately at loop exit, verifying that operand stack integrity is preserved across module boundaries.

(assert_invalid
  (module 
    (import "env" "func" (func $importedFunc (result i32)))
    (func $test-loop-within-block (result i32)
      (block (result i32)
        (loop (result i32)
          (call $importedFunc)
          (br_if 1 (i32.const 0))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
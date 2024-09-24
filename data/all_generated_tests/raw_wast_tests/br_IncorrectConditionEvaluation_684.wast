;; 5. **Test Description:**    Create a combination of arithmetic operations immediately before a `br_if`, where a falsely evaluated popped operand leads to an incorrect branch. This tests for correct operand transformation prior to condition checks.

(assert_invalid
  (module (func $test-diff (result i32)
    (block (result i32)
      (i32.add (i32.const 1) (i32.const 2))
      (br_if 0 (i32.const 3) (i32.const 0))
    )
    (i32.const 4)
  ))
  "type mismatch"
)
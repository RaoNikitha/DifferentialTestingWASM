;; Test 1: Create a test where `br_table` is used inside a loop construct and ensure the jump indexes into a vector of targets where the operand is out of bound, leading to different behavior when unwinding the stack and handling the default branch. - **Constraint Tested**: Correct handling of out-of-bounds operand and control flow manipulation within a loop.

(assert_invalid
  (module
    (func (param i32)
      (block (loop
        (br_table 0 0 (i32.const 5) (local.get 0))
      ))
    )
  )
  "unknown label"
)
;; 4. **Test Description**: A `block` with a conditional branch (`br_if`) that, based on the operand stack, will either complete the block or reach an `unreachable`. This can test whether branching conditions are evaluated correctly and `unreachable` is only reached under the failing condition.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (i32.const 1) 
      (br_if 0)
      (unreachable)
    )
  ))
  "type mismatch"
)
;; 7. **Test Name**: `else` Block with Unreachable Code    **Description**: Design an `else` block that includes an `unreachable` statement followed by valid instructions, and examine if the valid instructions are erroneously executed.    **Constraints Checked**: Handling and propagation of `unreachable` instructions.    **CFG Issue**: Ensures the CFG correctly handles paths marked as unreachable.

(assert_invalid
  (module (func $unreachable-else-block
    (if (result i32)
      (i32.const 0)
      (then (i32.const 1))
      (else (unreachable) (i32.const 2))
    )
  ))
  "type mismatch"
)
;; 6. **Test 6: Stack Overflows Due to Excessive Push in `then` Block**    - **Description**: Construct a scenario where the `then` block excessively pushes values onto the stack, leading to a potential stack overflow when transitioning to the `else` block.    - **Constraint Checked**: Verification of stack capacity and proper management of push operations within the branching blocks.    - **Relation to Stack Corruption**: Excessive pushes can overflow the stack leading to corruption and unexpected behavior.

(assert_invalid
  (module (func $overflow-push-in-then
    (if (result i32) (i32.const 1)
      (then (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1) (i32.const 1))
      (else (i32.const 0))
    )
  ))
  "stack overflow"
)
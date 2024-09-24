;; 1. **Test 1**:    - **Description**: A block structure (`block`) with an inner `br_if` that conditionally exits the outer block, provided an integer condition from the operand stack. Ensure that the operand stack is correctly unwound in both implementations.    - **Constraint**: Verifying correct stack unwinding for forward branch.    - **CFG Relation**: Tests forward jumping CFG correctness within nested block structures.

(assert_invalid
  (module
    (func $test_block_inner_br_if
      (block (result i32)
        (i32.const 42)
        (block (result i32)
          (i32.const 1)
          (br_if 1)
        )
      )
    )
  )
  "type mismatch"
)
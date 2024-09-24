;; 9. **Test for Mixed Type Blocks with Varied `if` Instructions**:    Use blocks of different types (e.g., `loop`) and place `if` statements within. Mix instructions like `br_if` to target specific type blocks and check resolution.    - **Constraint**: Ensure that branch targets respect the mixed nature of blocks and types.    - **Expectation**: Branch targets resolve distinctively based on the block type.

(assert_invalid
  (module
    (func $mixed-type-blocks
      (block (result i32)
        (if (result i32) (i32.const 1)
          (then (i32.const 1))
          (else (br_if 0 (i32.const 0) (i32.const 2)))
        )
      )
    )
  )
  "type mismatch"
)
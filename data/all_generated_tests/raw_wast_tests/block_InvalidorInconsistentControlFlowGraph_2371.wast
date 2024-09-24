;; 2. **Test Mismatched Block Type and Stack Manipulation**:    - Create a block where the block type expects a different stack configuration than what the instructions within the block produce.     - **Reasoning**: This tests the correctness of stack manipulation and validates if the context handling properly adjusts the CFG, especially around block boundaries.    - **Purpose**: Verifies correct CFG generation when block type constraints are violated internally.

(assert_invalid
  (module (func $mismatched-block-type
    (block (result i32)  ;; Block expects an i32 result
      (i64.const 1)      ;; Produces an i64
    )
  ))
  "type mismatch"
)
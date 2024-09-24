;; 1. **Test Case 1**:    - **Description**: Create a control block with an expected return type of `i64`, and within this block, use `br_if` to conditionally jump out with an `i32` type condition. The test checks if the `br_if` correctly interprets the return type of the block and identifies the mismatched operand stack type.    - **Constraint**: Ensures that the mismatched type (`i32` instead of `i64`) triggers an error in environments with stricter type enforcement.

(assert_invalid
 (module
  (func $type-mismatch-br_if (result i64)
   (block (result i64) (br_if 0 (i32.const 0)) (i64.const 1))
  )
 )
 "type mismatch"
)
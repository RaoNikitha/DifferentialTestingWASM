;; 1. **Test Description**:    Create a `block` with `blocktype` specifying a single `i32` result, but include instructions within the block that result in an `i64` instead. Check if both implementations correctly enforce the type constraint.    **Constraint**: Block result type must match expected type.    **Relation**: Ensures type mismatch is detected when exiting a block.

(assert_invalid
  (module (func $block_type_mismatch_test (result i32)
    (block (result i32) (i64.const 1))
  ))
  "type mismatch"
)
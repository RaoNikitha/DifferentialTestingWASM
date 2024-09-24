;; 2. **Exact Boundary Testing:**    - Description: Construct a `br_table` with an exact match to the highest valid index.    - Verify that the implementation correctly jumps to the target label at the highest permissible index.    - Specific Constraint: Confirm the proper handling of label lookups at boundary limits.

(assert_invalid
  (module (func $br-test-boundary
    (block (result i32) (br_table 0 1 (i32.const 1)) (i32.const 2))
  ))
  "type mismatch"
)
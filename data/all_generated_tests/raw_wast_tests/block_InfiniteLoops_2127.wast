;; 8. **Loop with Constant True `br_if` Condition**:    - **Test Description**: Insert a `br_if` within a block which always evaluates to true, causing the loop to never exit.    - **Constraint**: `br_if` should correctly evaluate conditions and break the loop accordingly.    - **Relation to Infinite Loops**: Constantly true `br_if` prevents loop from ever terminating.

(assert_invalid
  (module (func $type-break-infinite-loop (result i32)
    (block (result i32) (loop (result i32) (br_if 0 (i32.const 1))) (i32.const 0))
  ))
  "type mismatch"
)
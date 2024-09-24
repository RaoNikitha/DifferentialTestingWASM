;; 7. **Type Misalignment in Br-Table**: Implement a `block` expecting `i32` but include a `br_table` which refers to blocks producing `f32` and `i64`. This tests if the `br_table` respects the block's type constraints.

(assert_invalid
  (module (func $type-alignment-br-table
    (block (result i32)
      (i32.const 0)
      (br_table 0 (block (result f32) (f32.const 1.0)) (block (result i64) (i64.const 1)))
    )
  ))
  "type mismatch"
)
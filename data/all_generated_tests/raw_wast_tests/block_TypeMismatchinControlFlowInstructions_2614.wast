;; 5. **Type Mismatch in Nested Blocks**: Place a `block` within another `block` where the inner block has a result type of `i64` but its instructions leave an `i32` on the stack. This checks if the implementation correctly processes nested blocks' type constraints.

(assert_invalid
  (module (func $type-mismatch-nested-blocks
    (block (result i64)
      (block (result i32) (i32.const 42))
      (i64.extend_i32_s (i32.const 42))
    )
  ))
  "type mismatch"
)
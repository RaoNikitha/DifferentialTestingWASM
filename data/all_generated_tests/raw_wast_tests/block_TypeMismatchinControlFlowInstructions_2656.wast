;; Test 7: Have a block with a block type that expects an i32 and i64 input but specify only an i32 type for the inner operations. Check for correct detection and handling of mismatched input types within the block.

(assert_invalid
  (module (func $block-type-mismatch (result i32)
    (block (param i32 i64) (result i32)
      (i32.const 42)
    )
  ))
  "type mismatch"
)
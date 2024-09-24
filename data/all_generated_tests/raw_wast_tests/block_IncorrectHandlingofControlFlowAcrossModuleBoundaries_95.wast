;; 6. **Block ending with export function**:    - Implement sequence of blocks that ends with a call to an exported function and checks stack consistency upon returning to the calling module.    - Validate whether correct values are passed back, retaining operand stack accuracy and proper type compliance.

(assert_invalid
  (module
    (func $exported_func (export "exported_func") (result i32)
      (i32.const 42)
    )
    (func $block_ending_with_export (result i32)
      (block (result i32)
        (block (result i32)
          (call $exported_func)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)
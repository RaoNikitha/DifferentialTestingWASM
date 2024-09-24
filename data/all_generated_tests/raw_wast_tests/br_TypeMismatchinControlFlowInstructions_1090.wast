;; 1. A WebAssembly module with a block that expects two `i32` results but receives one `i64` and performs a `br` to exit the block. This will test type mismatch handling for block results.

(assert_invalid
  (module (func $block-type-mismatch
    (block (result i32 i32) (i64.const 42) (br 0))
  ))
  "type mismatch"
)
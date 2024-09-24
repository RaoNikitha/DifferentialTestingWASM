;; Construct a WASM module with a `block` that includes branching via `br_table` to labels defined in a different module. Validate that control flow correctly jumps between labels across the module boundary, ensuring stack consistency.

(assert_invalid
  (module 
    (func $block-with-br-table-cross-module (result i32)
      (block (result i32)
        (br_table 1 0 (i32.const 0) (i32.const 1))
        (i32.const 2)
      )
      (br 0)
    )
  )
  "label index out of bounds"
)
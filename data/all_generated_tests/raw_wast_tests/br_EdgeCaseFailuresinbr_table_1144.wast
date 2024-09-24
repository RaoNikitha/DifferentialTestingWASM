;; 5. **Test Description 5:**    Design a `br_table` instruction where the index is negative, ensuring that the engine correctly identifies and handles this invalid scenario. Note: WebAssembly instructions should not natively support negative indices, so this tests error handling robustness.

(assert_invalid
  (module
    (func $negative-index-br_table
      (block
        (i32.const -1)
        (br_table 0)
      )
    )
  )
  "type mismatch"
)
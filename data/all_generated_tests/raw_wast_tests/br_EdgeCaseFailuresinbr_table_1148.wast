;; 9. **Test Description 9:**    Create a `br_table` where some entries are valid and others intentionally reference out-of-scope control labels. This scenario simulates potential hazardous handling of possibly incorrectly compiled WebAssembly code.

(assert_invalid
  (module (func $br_table_invalid_label
    (block (result i32)
      (br_table 0 1 2 (i32.const 0)) (i32.const 0)
    )
  ))
  "type mismatch"
)
;; - **Test 3**: Define a `block` with a `br_table` that references a misaligned index, ensuring the edge case where indices are not sequentially incorrect in `wizard_engine` while WebAssembly maintains index alignment.

(assert_invalid
  (module (func $misaligned-br-table
    (block (block (br_table 0 2 1 (i32.const 0)))))
  )
  "unknown label"
)
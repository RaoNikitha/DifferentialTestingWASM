;; - **Test 4**: Use multiple nested `block` instructions with differing number of labels and implement a `br_table` targeting an invalid deeply nested block index. Examine the behavior difference in resolving the label index between `wizard_engine`'s `ctl_stack` and WebAssembly's context-based approach.

(assert_invalid
  (module (func $type-br_table-invalid-index
    (block (result i32)
      (block (block (br_table 2 (br_table 1 (i32.const 0)))) (i32.const 1)) 
      (i32.const 2)
    )
  ))
  "invalid label"
)
;; - **Test 2**: A nested `block` where an inner `br_table` jumps to a non-existent label in the outer block. Verify how `wizard_engine` manipulates `ctl_stack` for nested `br_table` while WebAssembly checks correct nesting context.

(assert_invalid
  (module
    (func $nested_br_table_non_existent_label
      (block (result i32)
        (block (result i32)
          (br_table 0 2 (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "label index out of range"
)
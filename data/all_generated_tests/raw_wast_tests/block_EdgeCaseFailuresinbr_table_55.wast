;; - **Test 6**: Construct a nested `block` with several valid `br_table` targets and a few invalid targets due to out-of-range indices. Test the specific differing failure points between `wizard_engine`'s `ctl_stack` approach and WebAssembly’s label context management.

(assert_invalid
  (module (func $nested-block-br-table
    (block $outer (result i32)
      (block $inner (result i32)
        (br_table 1 2  (i32.const 0))
        (i32.const 1)
      )
    )
  ))
  "out of range branch target"
)
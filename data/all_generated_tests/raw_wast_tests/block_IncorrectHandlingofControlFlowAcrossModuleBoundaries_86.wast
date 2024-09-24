;; **Test 7:** Develop a WASM module that exports a function using a `block` instruction with multiple branch labels. Import and call this function in another module using `br_if` and `br_table`. This evaluates if the control flow and label indexing are preserved correctly across module transitions.

(assert_invalid
  (module 
    (func $test_block_br_if_br_table
      (block $outer (result i32)
        (i32.const 1)
        (br_if $outer (i32.const 0))
        (block $inner (result i32)
          (i32.const 2)
          (br_table $outer $inner (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
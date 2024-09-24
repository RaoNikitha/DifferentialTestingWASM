;; **Test 5:** Design a WASM module that exports a function containing a `block` with mismatched operand and result types. Import this function in another module, and make a call within a loop using `br_table`. The test assesses if the context is correctly updated to prevent operand stack mismanagement across boundaries.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result f32)
        (i32.const 42)
        (br_table 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)
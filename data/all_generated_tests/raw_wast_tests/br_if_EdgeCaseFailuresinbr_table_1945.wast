;; 6. **Test Description**: Design a `br_if` that targets a non-conditional `block` placed within another conditional `block`. Include a `br_table` instruction with indices partially validated by the containing block’s arguments. Confirm correct handling by `wizard_engine` vs. potential confusion in WASM.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (block (result i32) 
          (br_if 0 (i32.const 1)) 
          (br_table 0 1 (i32.const 0)) 
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
;; 4. **Test 4**: Design a block where all `br_table` label indices are valid but introduce an operand type mismatch for one label. This tests if the early exit error handling for type mismatches in `wizard_engine` halts execution, unlike possible continued processing in `WebAssembly`.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result f32)
        (br_table 0 1 (i32.const 0))
      )
    )
  ))
  "type mismatch"
)
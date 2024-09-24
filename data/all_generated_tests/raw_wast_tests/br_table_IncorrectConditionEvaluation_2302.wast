;; 2. **Test 2**: Define a deeply nested block structure and initiate a `br_table` branch with labels indexed to various depths, making sure to include a condition where the operand stack unwinds differently. Validate if the operand type sequence is handled correctly under differing depths in `wizard_engine` vs. `WebAssembly`.

(assert_invalid
  (module (func $nested-br_table
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (br_table 5 3 2 1 0 (i32.const 0) (i64.const 1))
              )
              (i64.const 2)
            )
            (i32.const 3)
          )
          (i32.const 4)
        )
        (i32.const 5)
      )
      (i64.const 6)
    )
  ))
  "type mismatch"
)
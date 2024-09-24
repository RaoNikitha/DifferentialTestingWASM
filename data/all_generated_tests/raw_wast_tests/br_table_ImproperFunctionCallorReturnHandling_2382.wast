;; 2. Test a nested `br_table` with multiple layers of blocks where each block contains `call` instructions. Verify if the function return values correctly propagate through the nested blocks without causing any mismatches or stack errors.

(assert_invalid
  (module (func $nested-br_table-calls (result i32)
    (block (result i32)
      (block (result i32)
        (call $dummy)
        (block (result i32)
          (call $dummy)
          (block (result i32)
            (i32.const 0)
            (br_table 0 1 2 (i32.const 2))
          )
        )
      )
    )
  ))
  "unknown label"
)

(func $dummy (result i32) (i32.const 42))
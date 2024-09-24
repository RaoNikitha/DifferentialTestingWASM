;; 4. **Test 4**: An `if` with `else` where both branches contain `br_table` instructions that refer to different target sets, ensuring branches maintain distinct control flows.

(assert_invalid
  (module
    (func $br_table_in_if (result i32)
      (if (result i32) (i32.const 1)
        (then
          (block $inner
            (br_table $inner (i32.const 0) (i32.const 1))
            (i32.const 2)
          )
        )
        (else
          (block $outer
            (br_table $outer (i32.const 3) (i32.const 4))
            (i32.const 5)
          )
        )
      )
    )
  )
  "type mismatch"
)
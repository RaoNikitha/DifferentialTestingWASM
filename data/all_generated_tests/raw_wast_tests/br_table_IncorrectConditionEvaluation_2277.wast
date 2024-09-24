;; Test 7: Use `br_table` within a complex function involving multiple conditional and loop constructs, verifying that labels are referenced correctly and the correct branch target is chosen based on operand value.

(assert_invalid
  (module
    (func $complex-br_table
      (block (result i32)
        (i32.const 1)
        (block
          (loop (result i32)
            (i32.const 2)
            (if (result i32)
              (then (br_table 0 1 (i32.const 0)))
              (else (br_table 0 1 (i32.const 1)))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
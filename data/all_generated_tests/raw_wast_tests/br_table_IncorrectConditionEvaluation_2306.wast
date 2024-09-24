;; 6. **Test 6**: Formulate a complex nested if-else structure with `br_table` instructions containing mixed operand types and varied label depth referencing. This tests if condition evaluations diverge and are correctly managed, ensuring `wizard_engine` catches arity mismatches promptly.

(assert_invalid
  (module
    (func $complex-nested-mixed-types
      (block
        (i32.const 10)
        (block
          (i32.const 20)
          (block (result i64)
            (if (result i32)
              (then 
                (i32.const 1) 
                (br_table 0 1 2 (i32.const 2))
              )
              (else 
                (i64.const 2) 
                (br_table 1 0 2 (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
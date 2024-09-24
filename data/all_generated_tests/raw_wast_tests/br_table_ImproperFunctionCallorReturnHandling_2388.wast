;; 8. Design a series of nested control blocks with `br_table`, each containing multiple `call` and `return` instructions with type constraints. Verify that the calls and returns match the expected operand types and control flow rules.

(assert_invalid
  (module
    (func $nested-br-table
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 0)
            (i32.const 1)
            (if (result i32)
              (then
                (block (result i32)
                  (i32.const 2)
                  (call $dummy)
                  (br_table 0 1 2)
                )
              )
              (else
                (return (i32.const 3))
              )
            )
          )
        )
      )
    )
    (func $dummy (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)
;; 8. **Test for Improper Type Handling in a Loop within If**: Design a module with a `loop` instruction nested inside an `if` block where the `loop`'s block type mismatches with the type specified by the `if` instruction. This checks nested control flow type checks across different implementations.

(assert_invalid
  (module
    (func $type-loop-in-if (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then
          (loop (result i64)
            (i64.const 0)
            (if (i32.eq (i32.const 0) (local.get 0))
              (then (br 1))
              (else (i64.const 1))
            )
          )
          (i32.const 1)
        )
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)
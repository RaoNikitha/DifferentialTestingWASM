;; 7. Test complex, nested control structures with `br` instructions targeting different levels interspersed with imported function calls, specifically ensuring operand stack correctness.

(assert_invalid
  (module
    (func (export "test") (result i32)
      (i32.const 5)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (call_imported_func)
            (br 2))
          (br 1)
        )
        (i32.const 0)
      )
    )
    (import "env" "call_imported_func" (func $call_imported_func))
  )
  "type mismatch"
)
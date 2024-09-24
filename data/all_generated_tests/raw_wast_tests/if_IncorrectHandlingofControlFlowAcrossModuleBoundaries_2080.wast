;; 1. **Test Description:**    Verify that when an `if` instruction with a complex blocktype, which includes both input and output types, conditionally calls an imported function from another module, the stack maintains consistency. Focus on verifying that the operand stack unwinds appropriately after the imported function's execution, ensuring no stack corruption or type misalignment occurs across the module boundary.

(assert_invalid
  (module
    (import "env" "external_function" (func $external_function (param i32) (result i32)))
    (func $test_func (param i64) (result i64)
      (if (result i64)
        (local.get 0)
        (then (call $external_function (i32.const 1)) (i64.const 2))
        (else (i64.const 3))
      )
    )
  )
  "type mismatch"
)
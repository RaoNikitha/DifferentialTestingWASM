;; 6. Test a `br_if` within a deeply nested structure involving blocks and function calls. Ensure that the `br_if` correctly handles the operand stack and function return values. This will examine the correct unwinding and re-stacking behavior in wizard_engine.

(assert_invalid
  (module
    (func $deeply_nested (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (call $some_func)
                (br_if 4 (i32.const 1) (i32.const 0))
              )
              (i32.const 1)
            )
          )
        )
      )
      (i32.const 1)
    )
    (func $some_func (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)
;; 4. **Test Description 4:** Test a scenario where the external module export function includes a `br` to a deeply nested block that encompasses an imported function call, ensuring that the control flow and operand stack are correctly managed across module boundaries.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32)))
    (func (export "main") (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (br 3 (call $imported))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
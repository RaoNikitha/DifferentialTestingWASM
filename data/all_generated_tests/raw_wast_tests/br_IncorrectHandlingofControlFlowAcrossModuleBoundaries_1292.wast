;; 3. **Test Description 3:** Utilize an `if` construct within an exported function and employ `br` to exit the `if` block while calling an imported function. Check for correct stack unwinding and control resumption after returning from the imported function.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (export "test") (result i32)
      (i32.const 1)
      (if
        (block (br 0 (call $external_func)))
      )
    )
  )
  "type mismatch"
)
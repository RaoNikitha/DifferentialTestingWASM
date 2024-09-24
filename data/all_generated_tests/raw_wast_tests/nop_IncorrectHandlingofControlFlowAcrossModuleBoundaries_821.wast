;; 2. **Test 2: `nop` in Exported Function with Return**    - Place a `nop` instruction in an exported function that includes a return statement.    - Verify that `nop` does not affect the control flow when the function is invoked and the return value is passed correctly.

 ;; (module
  (func $func_return (result i32)
    (nop)
    (i32.const 42)
  )
  (export "test" (func $func_return))
)

(assert_return (invoke "test") (i32.const 42))
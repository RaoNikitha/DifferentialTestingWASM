;; 3. **Incorrect Argument Order for Function Call**: Define a loop with a call that requires arguments in a specific order. Intentionally push arguments in the wrong sequence to the stack before the call. This tests the transfer and ordering mechanism for arguments in loops.

(assert_invalid
  (module
    (func $incorrect-arg-order (i32.const 10) (i64.const 20) (call 1) (loop))
    (func (param i64 i32))
  )
  "type mismatch"
)
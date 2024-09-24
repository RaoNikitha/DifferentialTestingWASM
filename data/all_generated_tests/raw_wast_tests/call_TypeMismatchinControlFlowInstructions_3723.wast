;; - **Test 2**: Define a `loop` with a `call` instruction within that expects an `i64` argument, but only an `i32` value is on the stack. Check the stack underflow or type mismatch handling across the two implementations.

(assert_invalid
  (module
    (func $callee (param i64) (result i32)
      (i32.const 42)
    )
    (func $caller (result i32)
      (i32.const 0)
      (loop
        (call $callee)
      )
    )
  )
  "type mismatch"
)
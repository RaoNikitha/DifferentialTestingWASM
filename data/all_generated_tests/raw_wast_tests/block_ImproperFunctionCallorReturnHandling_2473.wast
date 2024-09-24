;; 4. **Test 4**: Use a `block` containing a `call` instruction leading to another `block` which eventually returns a value. This tests the correct propagation and unwinding of the operand stack through multiple control constructs.

(assert_invalid
  (module
    (func $nested-block-test (result i32)
      (block $outer
        (call $inner-block)
      )
    )
    (func $inner-block (result i32)
      (block $inner
        (i32.const 10)
        (return)
      )
    )
  )
  "type mismatch"
)
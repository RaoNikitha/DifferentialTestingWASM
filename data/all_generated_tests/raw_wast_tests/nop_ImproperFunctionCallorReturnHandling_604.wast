;; 5. **Test 5**: Embed `nop` within a function that itself makes a `call` to another function and then returns. Ensure the stack state is unchanged when `nop` executes and the return value from the inner function call remains accurate.

(assert_invalid
  (module
    (func $inner (result i32) (i32.const 42))
    (func $outer (result i32)
      (call $inner)
      (nop)
    )
  )
  "type mismatch"
)
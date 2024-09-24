;; 6. Design a recursive function where each recursive call uses the `return` instruction to exit. Check that the operand stack is correctly maintained across recursive calls and that there is no corruption when returning from deep recursion levels.

(assert_invalid
  (module
    (func $recursive_return (result i32)
      (local i32)
      (i32.const 1)
      (local.set 0)
      (block (result i32)
        (local.get 0)
        (call $recursive_return)
        (return)
      )
      (i32.const 0)
      (return)
    )
    (export "test" (func $recursive_return))
  )
  "type mismatch"
)
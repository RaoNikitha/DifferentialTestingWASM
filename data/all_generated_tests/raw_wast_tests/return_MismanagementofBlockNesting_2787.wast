;; Test 6: Create a function with nested blocks containing function calls that manipulate the stack. Place a `return` instruction after a series of nested function calls, ensuring that the operand stack state is correctly managed and the function returns the correct value.

(assert_invalid
  (module
    (func $nested-blocks (result i32)
      (i32.const 0)
      (block
        (call $inner-1)
        (block
          (call $inner-2)
          (return)
        )
      )
    )
    (func $inner-1 (result i32)
      (i32.const 1)
    )
    (func $inner-2 (result i32)
      (i32.const 2)
    )
  )
  "type mismatch"
)
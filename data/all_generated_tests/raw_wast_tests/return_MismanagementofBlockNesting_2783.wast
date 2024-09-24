;; Test 2: Design a test with nested loops and conditional branches, where a `return` instruction is placed within a conditional branch inside the innermost loop. Ensure the operand stack has different configurations depending on the path taken. Verify that `return` properly unwinds the stack and exits all nested control structures.

(assert_invalid
  (module
    (func $nested-loops-conditional-return (result i32)
      (i32.const 0) 
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (then
              (if (result i32)
                (then
                  (return (i32.const 42))
                )
                (else
                  (i32.const 5)
                )
              )
            )
            (else
              (i32.const 10)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
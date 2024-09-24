;; 4. **Loop with Unused Operands and Return**:    Test a scenario where a loop pushes extra unused operands on the stack before hitting a `return`. The test validates that the `return` instruction unwinds the stack correctly, ignoring any extra stack values, to prevent lingering in the loop and causing an infinite loop.

(assert_invalid
  (module
    (func $loop-with-unused-operands-and-return (result i32)
      (block
        (loop
          (i32.const 42)
          (i32.const 99)
          (return)
        )
      )
    )
  )
  "type mismatch"
)
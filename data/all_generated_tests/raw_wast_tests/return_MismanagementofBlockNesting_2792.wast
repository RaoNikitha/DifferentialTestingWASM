;; 1. Test a nested block scenario where the `return` instruction is placed within an inner loop which itself is nested inside an outer block. Verify if the control flow properly returns from the function instead of just breaking the inner block or loop. This tests whether stack unwinding correctly respects the stack frame of the outer block.

(assert_invalid
  (module
    (func $nested-block-return (result i32)
      (block
        (loop
          (return (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
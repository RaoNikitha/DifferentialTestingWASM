;; 1. **Test Description:**    Create a module that calls an imported function, which immediately uses a `br` instruction to leave a nested block. Verify that the operand stack is correctly managed and the execution flow returns to the caller module correctly.

(assert_invalid
  (module
    (import "env" "impFunc" (func $impFunc))
    (func (call $impFunc)
      (block
        (block
          (br 1)
        )
      )
      (nop)
    )
  )
  "type mismatch"
)
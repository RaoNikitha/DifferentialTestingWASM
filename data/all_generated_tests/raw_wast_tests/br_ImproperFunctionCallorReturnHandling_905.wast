;; 6. **Interrupt Function Call with Br Then Return:**    Insert a `br` instruction within a function that breaks out multiple lexical scopes, followed immediately by a return instruction. This tests if the `br` correctly handles unwinding multiple levels and properly manages subsequent return.

(assert_invalid
  (module
    (func $interrupt-function-call-with-br-then-return
      (block 
        (block 
          (br 1)
          (return)
        )
      )
    )
  )
  "type mismatch"
)
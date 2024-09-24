;; 1. **Unreachable Function Call**:    Create a test where a function is called from within a block of code that is deemed unreachable. Verify if the call instruction is properly validated and recognized despite the enclosing block being unreachable. This checks if the CFG correctly identifies the call's context in dead code regions.

(assert_invalid
  (module
    (func $unreachable-call (unreachable) (call 0))
    (func (param i32) (result i32)
      (i32.const 42)
    )
  )
  "unreachable code"
)
;; 1. **Unreachable Code After Return**:    - Test a function where the `return` instruction is immediately followed by additional instructions. The `check_instr` function in WebAssembly may correctly identify these instructions as unreachable, while `validateCode` in Wizard Engine might mistakenly execute them.

(assert_invalid
  (module
    (func $unreachable-code-after-return (result i32)
      (i32.const 1)
      (return)
      (i32.const 2)
      (i32.add)
    )
  )
  "unreachable code after return"
)
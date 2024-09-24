;; 2. **Test Description**:    - **Scenario**: Export a function from Module A and then import and call it from Module B using a `call` instruction.    - **Constraint**: Check that the control flow transitions correctly between Module A and Module B without disrupting the stack state.    - **Differential Check**: Confirm consistent handling of function indices and stack operations across module boundaries in both implementations.

(assert_invalid
  (module
    (import "moduleA" "funcA" (func $importedFunc (param i32) (result i32)))
    (func $callImportedFunc (result i32)
      (call $importedFunc (i32.const 42))
    )
    (export "callFunc" (func $callImportedFunc))
  )
  "unknown import"
)
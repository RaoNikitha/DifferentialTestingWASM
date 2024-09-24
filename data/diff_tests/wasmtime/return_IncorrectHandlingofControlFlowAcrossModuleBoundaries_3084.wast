;; 3. **Test Return with Intermediate Values on Stack**:    - Description: Within an exported function, call an imported function that returns while intermediate values are left on the operand stack. Ensure these intermediate values are properly discarded after the return.    - Constraint: Validate that the `return` instruction correctly discards intermediate stack values upon returning to the outermost block.

(assert_invalid
  (module
    (import "env" "importedFunc" (func $importedFunc (result i32)))
    (func (export "testFunc") (result i32)
      (i32.const 42)
      (call $importedFunc)
      (i32.const 1)
      (i32.add)
      (return)
    )
  )
  "type mismatch"
)
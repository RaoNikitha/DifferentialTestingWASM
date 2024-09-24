;; 8. **Correct Operand Handling Across Modules:**    - Use a `block` with a `br` instruction to break out and call an imported function from the block context in module A sourcing from module B. Ensure the operand stack aligns with the expected types across the module boundary call.    - **Constraint Checked:** Operand type and stack consistency during cross-border function calls.    - **Relation to Constraint:** Verifies that stack and operand management work correctly when control flow crosses module boundaries.

(assert_invalid
  (module
    (import "moduleB" "importedFunc" (func $importedFunc (param i32) (result i32)))
    (func (param i32) (result i32)
      (block (result i32)
        (br 0 (call $importedFunc (local.get 0)))
      )
    )
  )
  "type mismatch"
)
;; 5. **Operand Type Mismatch in Nested Loop:**    Create nested loops with incompatible operand types and target them in `br_table`.    - **Test Constraint:** The operand types must match for valid branching.    - **Expected Differential:** WebAssembly will enforce operand type matching while wizard_engine might incorrectly resolve the branch.

(assert_invalid
  (module (func $operand-type-mismatch-in-nested-loop
    (block
      (block (result i32) (loop (i32.const 0) (br_table 0 2 (i32.const 1)) (drop)))
    )
  ))
  "type mismatch"
)
;; 9. **Switch Case-Like Scenario with Mismatched Types:**    Emulate a switch case with `br_table`, with mismatched operand types for branches.    - **Test Constraint:** Labels must match operand type sequences.    - **Expected Differential:** WebAssembly should catch type mismatches, wizard_engine might branch incorrectly.

(assert_invalid
  (module
    (func $switch_case_mismatch_type (result i32)
      (block (result i32)
        (br_table 0 0 1 (i32.const 2) (i64.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
;; 2. **In-Nest Mismatched Labels:**    Use a `br_table` with labels referring to blocks of mismatched operand types within nested blocks.    - **Test Constraint:** The labels should point to parent blocks with the same operand types.    - **Expected Differential:** WebAssembly should trap or show type mismatch, wizard_engine might incorrectly resolve the target.

(assert_invalid
  (module
    (func (param i32)
      (block (result i32)
        (block (result i32)
          (br_table 1 0 (local.get 0)) ; Label 1 refers to an invalid block with mismatched operand types
        )
      )
    )
  )
  "type mismatch"
)
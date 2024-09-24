;; 2. **Indirect Branch to Default Label after Exported Function Call:**    - Create a module where `br_table` follows a call to an exported function with a branch operand directing to a default label.    - **Constraint Checked:** Ensures the control flow properly handles transitions from an exported function within the same module to a local label.    - **Reasoning:** Tests if the `br_table` instruction maintains correct control flow and stack state across calls returning from exported functions.

(assert_invalid
  (module
    (func $call_exported_function_and_br_table
      (call $exported_function)
      (block
        (br_table 0 1 (i32.const 2))
      )
    )
    (func $exported_function
      (i32.const 0)
    )
    (export "exported_function" (func $exported_function))
  )
  "unknown label"
)
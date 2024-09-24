;; 4. Test a scenario where a `br_if` is used within a block that contains multiple function calls, ensuring that when the branch is taken, the function call hierarchy and return values are managed correctly. This will probe potential differences in how branch targeting and stack unwinding are handled in wizard_engine compared to WASM.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result i32)
        (call $dummy)
        (br_if 0 (i32.const 1))
        (call $dummy)
        (i32.const 0)
      )
    )
    (func $dummy)
  )
  "type mismatch"
)
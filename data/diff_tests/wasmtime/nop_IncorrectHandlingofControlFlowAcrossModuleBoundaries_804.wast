;; 5. **Test Exporting Function Calling `nop` in Sequence with Imported Functions**:    - **Constraint Checked**: Ensures sequential calling with `nop` does not corrupt control flow.    - **Description**: Export a function that sequences calls to an imported function interspersed with `nop` instructions. Check if both implementations maintain correct control flow and stack state without corruption.

(assert_invalid
  (module
    (import "env" "foo" (func $foo))
    (func $exported (export "exported")
      (call $foo)
      (nop)
      (call $foo)
      (nop)
      (call $foo)
    )
  )
  "invalid import function type"
)
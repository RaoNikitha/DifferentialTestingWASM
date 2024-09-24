;; 1. **Test 1: `nop` in Imported Function Call Stack**    - Validate handling of stack when calling an imported function that includes a `nop` instruction at the start.    - Ensure that the `nop` does not affect the operand stack or control flow as the control returns to the calling module.

(assert_invalid
  (module
    (import "" "func" (func $imported (result i32)))
    (func $test (result i32)
      (call $imported)
      (nop)))
  "type mismatch")
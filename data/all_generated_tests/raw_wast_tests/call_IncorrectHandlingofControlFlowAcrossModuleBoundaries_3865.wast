;; 4. **Return from Imported Function with Correct Results**:    Test returning values from an imported function back to the calling module. The wizard_engine's `pushTypes` should ensure that the result values are correctly placed on the stack, highlighting any errors if the WebAssembly implementation mishandles the stack.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $return_from_external
      (i32.eqz (call $external_func))
    )
  )
  "type mismatch"
)
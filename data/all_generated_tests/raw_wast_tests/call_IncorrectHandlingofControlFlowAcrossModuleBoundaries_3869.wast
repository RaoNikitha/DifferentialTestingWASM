;; 8. **Call Exported Function with Different Return Types**:    Call an exported function that returns a different set of values to the caller. This tests if stack results are correctly pushed and handled across module boundaries, checking for consistency in `pushTypes` in the wizard_engine.

(assert_invalid
  (module
    (func $type-different-returns (result i32) (call 1 (i32.const 10)) (i32.const 0))
    (func (result f32))
    (export "type-different-returns" (func 0))
  )
  "type mismatch"
)
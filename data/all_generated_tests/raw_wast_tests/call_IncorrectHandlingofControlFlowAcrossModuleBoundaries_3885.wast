;; 4. **Test Description**:    - **Scenario**: Use a `call` instruction for a function imported with a complex signature (multiple return types).    - **Constraint**: Ensure the correct handling of function signature and return types across module boundaries.    - **Differential Check**: Validate that both WebAssembly and wizard_engine correctly manage the return types and stack adjustments.

(assert_invalid
  (module
    (import "env" "complex_func" (func $complex_func (result i32 f32)))
    (func $test
      (call $complex_func)
    )
  )
  "type mismatch"
)
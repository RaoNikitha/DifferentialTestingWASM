;; 3. **Test 3: Multiple Result Types Mismatch**    - Description: Specify a loop block type with multiple result types (e.g., i32, f32), but the enclosed instructions produce a different set of types (e.g., f32, i64).    - Reasoning: This checks the system's ability to validate and match complex result types involving multiple values.

(assert_invalid
  (module
    (func $multiple-result-types-mismatch
      (loop (result i32 f32)
        (f32.const 0.0)
        (i64.const 0)
      )
    )
  )
  "type mismatch"
)
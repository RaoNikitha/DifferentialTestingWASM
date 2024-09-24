;; 10. **Inline Block Type Usage with Module Imports**:    - Use the shorthand notation `valtype?` as a block type for a block instruction calling an imported function multiple times. This assesses if both inline block type and imported function’s transitions are correctly handled without causing stack issues.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test_func
      (block (result i32)
        (drop (call $external_func (i32.const 0)))
        (drop (call $external_func (i32.const 1)))
        (br 0 (call $external_func (i32.const 2)))
      )
    )
  )
  "type mismatch"
)
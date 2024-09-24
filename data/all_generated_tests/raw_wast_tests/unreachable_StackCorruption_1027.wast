;; 8. **Test 8: `unreachable` After Type Conversions**    - Test involves type conversion instructions (e.g., i32 to i64) followed immediately by `unreachable`.    - Assess whether both implementations handle stack values correctly during the type conversion and immediate trap scenario.    - Ensures proper stack type handling and clearance post-conversion and trap.

(assert_invalid
  (module
    (func $unreachable-after-type-conversion
      (i32.const 42)
      i64.extend_i32_s
      unreachable
      (i64.const 0)
    )
  )
  "type mismatch"
)
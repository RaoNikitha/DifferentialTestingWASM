;; 8. **Test Case 8:** Use `br_table` within an exception handling construct, placing `unreachable` before the instruction triggering an exception to see if it propagates traps appropriately and avoids running the problematic index. \    _Constraint Checked: Error handling in Wasm implementations ensuring unified traps._

(assert_invalid
  (module (func $test
    (try (result i32)
      (do (unreachable) (br_table 0 (i32.const 0)))
      (catch (i32.const 42))
    )
  ))
  "type mismatch"
)
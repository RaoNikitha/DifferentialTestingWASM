;; 9. **Invoke Imported Function with Local Side Effects**:    Test calling an imported function that modifies local state or globals in an unexpected way. This verifies if the calling module’s state and stack are correctly preserved or restored post call, particularly important for control flow correctness.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (global $g i32 (i32.const 0))
    (func $test
      (local i32)
      (local.set 0 (i32.const 1))
      (call $external_func (local.get 0))
      (global.set $g (i32.add (global.get $g) (local.get 0)))
    )
  )
  "type mismatch"
)
;; 5. **Test 5: `nop` Before and After Call to Imported Function**    - Place a `nop` before and after a call to an imported function.    - Ensure the `nop` instructions do not interfere with the function call or its return value, maintaining stack integrity.

(assert_invalid
  (module
    (import "env" "external_function" (func $external_function (result i32)))
    (func $test (result i32)
      (nop)
      (call $external_function)
      (nop)
    )
  )
  "type mismatch"
)
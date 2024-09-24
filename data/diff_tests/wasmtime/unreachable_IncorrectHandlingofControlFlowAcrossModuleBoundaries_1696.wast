;; 7. **Nested Call Chains with `unreachable` in Multiple Import Functions:**    - Construct a series of nested function calls across multiple modules where each function calls an imported function and somewhere within these calls, one contains `unreachable`.    - **Constraint:** Verifies consistent trap propagation when `unreachable` is encountered deep within nested call chains.

(assert_invalid
  (module
    (import "env" "imported_func1" (func $imported_func1 (result i32)))
    (import "env" "imported_func2" (func $imported_func2 (result f32)))
    (func $nested_call_chain (result i32)
      (call $imported_func1)
      (call $imported_func2)
      (unreachable)
      (i32.const 0)
    )
  )
  "type mismatch"
)
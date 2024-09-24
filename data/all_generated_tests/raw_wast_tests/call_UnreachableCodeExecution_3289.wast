;; 8. **Test 8: Dynamic Function Index Calculation**    - Design a test where the function index is dynamically calculated at runtime, possibly leading to out-of-bounds access.    - **Specific Constraint**: Ensures that dynamic calculations for function indices fall within valid ranges or proper error handling catches errors before reaching 'unreachable'.    - **Test Relation**: Prevents miscalculation from causing erroneous control paths reaching 'unreachable' instructions.

(assert_invalid
  (module
    (func $dynamic_call (param i32 i32)
      (local $calc_idx i32)
      (local.set $calc_idx
        (i32.add (local.get 0) (local.get 1))
      )
      (call_indirect (type 0) (local.get $calc_idx) (i32.const 0))
    )
    (type (func (param i32) (result i32)))
    (table 0 funcref)
  )
  "type mismatch"
)
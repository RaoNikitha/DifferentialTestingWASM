;; 10. **Cross-Module Indirect Calls with Different Contexts**:    - Employ multiple modules where `call_indirect` instruction references functions and tables across different modules with incompatible types.    - This test examines how CFG handles cross-module references, ensuring the correct trapping of type mismatches and validation of function calls, preserving correct control flow.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (module $mod1
      (type $sig2 (func (param f64) (result f64)))
      (table 1 funcref)
      (func $func1 (type $sig2) (f64.const 0.0))
      (elem (i32.const 0) $func1)
    )
    (import "mod1" "table" (table funcref))
    (func $test
      (call_indirect (type $sig1) (i32.const 0))
    )
  )
  "type mismatch"
)
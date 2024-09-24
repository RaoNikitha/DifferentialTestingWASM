;; 4. **Test Description 4**:    - Implement a WebAssembly module where `call_indirect` calls are within conditional blocks (`if` statements) that lead to branching instructions (`br_if`). Test if the outcome of `call_indirect` function calls remains contingent on the proper resolution of the conditions when branching towards or away from `call_indirect`, thus revealing mismatched behaviors.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $test (param i32)
      (table funcref)
      (elem (i32.const 0) $test)
      (if (param i32) (result i32)
        (i32.eqz (local.get 0))
        (then (call_indirect (type $sig) (i32.const 0)))
        (else (call_indirect (type 0) (i32.const 1)))
      )
      (br_if 0 (i32.const 1))
    )
  )
  "type mismatch"
)
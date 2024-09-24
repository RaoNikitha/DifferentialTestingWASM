;; 8. **Test 8: Import Export Interaction with Interleaved `nop`**    - Interleave `nop` instructions within a complex interaction of imported and exported functions.    - Validate stack neutrality and correct transition of control flow between these interleaved calls.

(assert_invalid
  (module
    (import "env" "funcA" (func $funcA (result i32)))
    (import "env" "funcB" (func $funcB))
    (func (export "funcC")
      (call $funcA)
      nop
      (call $funcB)
      nop
      (i32.add)
    )
  )
  "type mismatch"
)
;; 6. **Test 6: Nested `nop` Inside Exported Functions**    - Create nested calls to multiple exported functions each containing a `nop`.    - Verify the correct control flow and stack state are maintained across nested `nop` instructions across exported boundaries.

 ;; (module
  (func (export "nested_nop1") (nop))
  (func (export "nested_nop2") call $nested_nop1 (nop))
)
(assert_invalid
  (module
    (func (export "nested_nop1") (if (i32.const 1) (then (nop))))
    (func (export "nested_nop2") call $nested_nop1 (nop))
  )
  "type mismatch"
)
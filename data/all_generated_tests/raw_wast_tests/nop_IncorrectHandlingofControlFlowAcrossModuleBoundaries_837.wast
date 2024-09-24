;; 8. Test a module that makes a `call_indirect` to an imported function, surrounded by `nop` instructions. Implement the host module with different function signatures, including control flow instructions. This will assess if the `nop` instruction properly allows the indirect call and return mechanism to function across module boundaries without disrupting control flow.

(assert_invalid
  (module
    (import "env" "callback" (func $callback (result i32)))
    (func (result i32)
      (nop)
      (call_indirect (type $t1) (i32.const 0))
      (nop)))
  "type mismatch"
)
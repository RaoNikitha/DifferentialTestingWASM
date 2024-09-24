;; 5. Test Description: Place a `nop` instruction before an indirect call to a function that contains an `unreachable`. Verify that the `nop` does not interfere and the `unreachable` is correctly executed upon the call.

(assert_invalid
  (module
    (func $type-void (nop) (unreachable))
    (type $t0 (func))
    (table anyfunc (elem $type-void))
    (func (call_indirect (type $t0) (i32.const 0)))
  )
  "unreachable executed"
)
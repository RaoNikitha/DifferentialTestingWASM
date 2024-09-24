;; 6. Test an indirect function call table where one of the functions contains an `unreachable` instruction. Check if invoking this function via the table properly handles the trap and does not corrupt the stack.

(assert_invalid
  (module
    (type $t0 (func))
    (table 1 funcref)
    (elem (i32.const 0) $f0)
    (func $f0 (unreachable))
    (func (call_indirect (type $t0) (i32.const 0)))
  )
 "type mismatch"
)
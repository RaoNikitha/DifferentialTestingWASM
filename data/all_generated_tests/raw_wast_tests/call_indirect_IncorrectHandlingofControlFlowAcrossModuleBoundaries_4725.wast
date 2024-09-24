;; 4. Test `call_indirect` with a mismatched function signature in an imported module's table, verifying that the type mismatch causes a trap and the crossing of module boundary doesn’t bypass this essential check.

(assert_invalid
  (module
    (type (func (param i32)))
    (import "mod" "table" (table 1 funcref))
    (func $mismatch (call_indirect (type 0) (i32.const 0) (f32.const 3.14)))
  )
  "type mismatch"
)
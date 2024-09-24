;; 7. Test the behavior when a `call_indirect` instruction is used to call a function that has significantly differing parameter and return types than expected, to verify if type checking and stack handling are robustly implemented.

(assert_invalid
  (module
    (func $f (param i64) (result i64))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $type-mismatch
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)
;; 10. Write a test where `unreachable` is placed right before yielding control back from a `call_indirect` instruction. Ensure the function traps immediately rather than returning a value or continuing execution.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $target)
    (func $target (result i32) (unreachable) (i32.const 0))
    (func (result i32)
      (call_indirect (type $t) (i32.const 0))
    )
  )
  "type mismatch"
)
;; 3. **Indirect Call with Mismatched Types:**    An indirect call with a function type that does not match the expected signature, followed by a `br` instruction. Confirm if the `br` appropriately handles the type mismatch by restoring the operand stack properly for the indirect call.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $f (type $sig) (param i32) (result i32)
      (call_indirect (type $sig) (i32.const 0) (i32.const 1))
      (br 0)
    )
  )
  "type mismatch"
)
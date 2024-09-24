;; 8. Simulate inadequate operand stack values for `call_indirect` within a `br_table` instruction, leading to a dynamic type mismatch and verifying the trap behavior.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (block
        (br_table 0 (i32.const 0) (i32.const 1))
        (call_indirect (type 1) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
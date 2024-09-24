;; Implement a conditional evaluation with `br_if` that has an insufficient number of operands on the stack for the `call_indirect` instruction, checking that a stack underflow trap is correctly generated.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $test (param i32)
      (local i32)
      (i32.const 1)
      (i32.const 0)
      (br_if 0) 
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
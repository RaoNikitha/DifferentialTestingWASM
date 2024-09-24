;; Set up a `call_indirect` instruction after a `br_if` with a complex condition involving multiple stack operations, verifying that incorrect condition evaluation does not disrupt the correct sequence of operand handling and function invocation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      local.get 0
    )
    (func $test
      (local i32)
      (i32.const 0)
      (i32.const 1)
      (i32.sub)
      (i32.const -1)
      (i32.add)
      (br_if 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)
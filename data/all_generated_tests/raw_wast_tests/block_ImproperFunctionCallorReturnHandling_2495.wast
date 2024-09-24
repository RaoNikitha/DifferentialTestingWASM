;; A `block` instruction with interleaved `call_indirect` instructions and direct function calls, focusing on accurate execution and return values from indirect and direct function calls. This ensures that both function call types are correctly interpreted and executed within a block.

(assert_invalid
  (module
    (type $type-funcref (func (result i32)))
    (table funcref (elem (ref.func 0)))
    (func $call-function (result i32) (i32.const 42))
    (func $type-call-indirect-vs-call (result i32)
      (block (result i32)
        (call_indirect (type $type-funcref) (i32.const 0))
        (call $call-function)
      )
    )
  )
  "type mismatch"
)
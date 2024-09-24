;; A `block` that includes a `call_indirect` instruction, checking if the stack is properly managed and the indirect call’s return value is accounted for in the block’s result type.

(assert_invalid
  (module (func $$type-block-call-indirect (result i32)
    (block (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
      (i32.const 42)
    )
  ))
  "type mismatch"
)
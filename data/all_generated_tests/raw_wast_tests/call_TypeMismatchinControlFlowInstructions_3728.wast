;; - **Test 7**: Design a test with a `call` instruction in a `block` with mismatched type return type (function returns `i32` but block expects `f64`). This checks type propagation and validation in control flow.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $mismatch
      (block (result f64)
        (call 0)
      )
    )
    (func (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)
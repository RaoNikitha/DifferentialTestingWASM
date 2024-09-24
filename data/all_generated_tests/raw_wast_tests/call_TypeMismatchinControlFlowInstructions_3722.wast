;; - **Test 1**: Create a function that expects a `f32` argument but pass a `i32` argument from a `block` instruction. This should trigger a type mismatch error during the type check but might be handled differently due to varied explicit stack operations.

(assert_invalid
  (module
    (func $mixed-type-call
      (block (call 1 (i32.const 42)))
    )
    (func (param f32))
  )
  "type mismatch"
)
;; 1. **Test Description 1**:    - This test involves a `call_indirect` instruction inside a `loop` block. The function type used in `call_indirect` is not defined in the module, causing a type mismatch and potentially triggering an infinite loop due to repeated type checking failures.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $loop-call-indirect
      (loop
        (call_indirect (type 1) (i32.const 0) (i32.const 0))
      )
    )
  )
  "unknown type"
)
;; 7. **Test Description 7**:    Design a test where the `loop` instruction reinitializes its block with a `call_indirect` that could potentially invoke varying function types. Check if the subsequent loop iterations maintain correct return addresses and stack alignment.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table $tbl 1 funcref)
    (elem (i32.const 0) $f1)
    (func $f1 (result i32) (i32.const 0))
    (func $type-loop-indirect-call
      (loop (result i32)
        (call_indirect (type $sig) (i32.const 0) (i32.const 42))
        (br 0)
      )
    )
  )
  "type mismatch"
)
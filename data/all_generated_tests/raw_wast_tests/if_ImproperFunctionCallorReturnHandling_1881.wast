;; - **Test 2**: Implement an `if` block with an `else` and a subsequent `call_indirect` instruction within the `else` branch. Test if the `else` branch, when taken, correctly resolves the indirect function call.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (table $tab 1 funcref)
    (elem (i32.const 0) $f1)
    (func $f1 (param i32) (result i32) (i32.const 42))
    (func $type-indirect-call-in-else (param i32) (result i32)
      (if (result i32)
        (i32.eqz (local.get 0))
        (then (i32.const 0))
        (else
          (call_indirect (type $t) (local.get 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
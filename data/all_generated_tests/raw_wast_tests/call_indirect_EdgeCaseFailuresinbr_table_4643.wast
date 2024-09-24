;; 2. Test providing a `call_indirect` instruction that dynamically resolves to a function with mismatched parameters compared to the expected `typeidx`, which then affects `br_table` execution.

(assert_invalid
  (module
    (type (func (param f64) (result i32)))
    (type (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32) (local.get 0))
    (func (param i32)
      (call_indirect (type 0) (i32.const 0) (local.get 0))
    )
  )
  "type mismatch"
)
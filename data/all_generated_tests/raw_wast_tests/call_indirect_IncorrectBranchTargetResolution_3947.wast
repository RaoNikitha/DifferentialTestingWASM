;; 6. Involve a nested function call structure where `call_indirect` is used within a try-catch like construct. Ensure the incorrect branch resolution by a `br` instruction leads to the function call resolving an unexpected function type during exception handling.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $target (type 0) (param i32 i32) (result i32) (i32.add (local.get 0) (local.get 1)))
    (elem (i32.const 0) 0)
    (func $try-catch
      (try $label
        (do
          (call_indirect (type 0) (i32.const 0) (i32.const 10) (i32.const 20)))
        (catch $label
          (call_indirect (type 1) (i32.const 0) (i32.const 10))))
    )
  )
  "type mismatch"
)
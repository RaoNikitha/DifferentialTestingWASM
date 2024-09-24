;; Execute a `call_indirect` instruction with a mismatched function signature and confirm that the WebAssembly implementation performs proper type checking, throwing an error if the types mismatch. Examine wizard_engine for improper type checking leading to incorrect function calls.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table funcref (elem 0))
    (func (type 0) (i32.const 42))
    (func (type 0) (call_indirect (type 0) (i32.const 0) (i32.const 1)))
  )
  "type mismatch"
)
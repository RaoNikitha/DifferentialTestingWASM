;; 1. Create a `call_indirect` instruction that attempts to call a function with a return type of `i32`, but the actual function in the table returns `i64`. This tests type conformity within the dynamic type checking constraint.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result i64)))
    (func $func (result i64) (i64.const 42))
    (table funcref (elem $func))
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
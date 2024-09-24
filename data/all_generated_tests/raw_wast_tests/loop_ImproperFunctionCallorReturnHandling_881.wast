;; Develop a loop that uses the `call_indirect` instruction. Ensure the function type is incorrectly specified in the type table. This test checks for discrepancies in type handling for indirect calls within a loop.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func (loop (call_indirect (type (param i32) (result i64)) (i32.const 0) (i32.const 1))))
  )
  "type mismatch"
)
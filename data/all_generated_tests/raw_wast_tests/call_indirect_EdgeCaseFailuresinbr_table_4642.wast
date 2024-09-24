;; 1. Test where the function table contains fewer entries than required by `br_table`, causing an out-of-bound index when `call_indirect` falls through.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref (elem (ref.func $dummy)))
    (func $dummy (param i32) (result i32)
      (i32.const 42))
    (func (result i32)
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "type mismatch"
)
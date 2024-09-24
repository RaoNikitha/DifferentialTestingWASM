;; Craft a loop containing a `call_indirect` with a valid table index but incorrect function signature. This will confirm if contexts can handle indirect function calls with mismatched types differently.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32) (result i32) (i32.const 42))
    (func (result i32)
      (loop
        (call_indirect (type $sig) (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)
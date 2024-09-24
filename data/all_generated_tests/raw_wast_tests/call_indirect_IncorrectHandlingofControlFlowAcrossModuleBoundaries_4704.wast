;; 3. Import a function that internally performs a `call_indirect` to another function in the table. The test should confirm that the nested indirect call does not result in an incorrect stack state or a mismatch of function signatures.

(assert_invalid
  (module
    (type $sig0 (func (param i32) (result i32)))
    (type $sig1 (func (param i32)))
    (table 1 funcref)
    (func $inner (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0) (i32.const 0))
    )
    (elem (i32.const 0) $inner)
    (func (param i32) (result i32)
      (call_indirect (type $sig0) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)
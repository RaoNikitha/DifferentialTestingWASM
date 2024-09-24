;; 4. Develop a test where `call_indirect` attempts to call a function from an invalid table index that points to an undefined table within the module, expecting it to trigger an error due to improper function call handling.

(assert_invalid
  (module
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 2))
    )
    (type (func (result i32)))
  )
  "out of bounds table access"
)
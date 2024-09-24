;; 9. Develop a WebAssembly module that utilizes multiple `call_indirect` instructions and `br_on_null` targeting different blocks. Check if differential signature handling causes incorrect branches to blocks that should not be executed.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (table 2 funcref)
    (func $f1 (result i32)
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
    )
    (func $f2 (param i32)
      (br_on_null 0 (call_indirect (type $sig2) (i32.const 1)))
    )
    (elem (i32.const 0) $f1 $f2)
  )
  "type mismatch"
)
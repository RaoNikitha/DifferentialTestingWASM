;; - Test 6: Use `call_indirect` within a block to target a function which is of a type not listed in the module's type section. This tests the block's handling of indirect calls and their adherence to type constraints.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      (i32.const 0)
    )
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func (result i32)
      (block (result i32)
        (i32.const 0)
        (call_indirect (type $t1) (i32.const 1) (i32.const 0))  
      )
    )
  )
  "type mismatch"
)
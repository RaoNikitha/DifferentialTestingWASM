;; 2. **Type Mismatch Between Function Signature and Table Entry:**    - Check the system's response when the function in the table has a different signature than expected. The test should confirm a trap due to type mismatch, ensuring both OCaml and Java implementations handle the error according to the functional type constraints.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32 i32))) 
    (func $f (type $sig2) (param i32 i32))
    (table funcref (elem $f))
    (func $mismatch-test 
      (call_indirect (type $sig1) (i32.const 0) (i32.const 10))
    )
  )
  "type mismatch"
)
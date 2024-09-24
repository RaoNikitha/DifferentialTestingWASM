;; 3. Create a scenario where an indirect call is made with proper index bounds but with an incorrect function reference type within the table. This checks if the implementation correctly aborts the call with a type reference trap.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $f (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $test
      (call_indirect (type $sig2) (i32.const 0) (i32.const 42) (i32.const 43))
    )
  )
  "type mismatch"
)
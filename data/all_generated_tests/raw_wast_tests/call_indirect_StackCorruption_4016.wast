;; 5. Create a function that expects specific types and sequences of operands but deliberately call it with incorrect types or an inadequate number of operands using `call_indirect`. Ensure the test traps correctly and examine the integrity of the stack.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32) (local.get 0))
    (table $table 1 funcref)
    (elem (i32.const 0) $f)
    (func $test
      (call_indirect (type $sig) (i32.const 0) (i32.const 1) (i64.const 2))
    )
  )
  "type mismatch"
)
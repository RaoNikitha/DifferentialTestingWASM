;; 9. Create a scenario where multiple `call_indirect` instructions are chained, with the second depending on the successful return of the first, and test if improper condition evaluations in one affect the correctness of the next.

(assert_invalid
  (module
    (type $func_type_1 (func (param i32) (result i32)))
    (type $func_type_2 (func (param i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32)
      (i32.const 42)
    )
    (func $chain_test
      (local $result i32)
      (local.set $result
        (call_indirect (type $func_type_1) (i32.const 0))
      )
      (call_indirect (type $func_type_2) (local.get $result))
    )
  )
  "type mismatch"
)
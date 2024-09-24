;; 1. Define two functions with mismatched types in the table and then use the `call_indirect` instruction to invoke one of these functions. Check for the proper handling of type conformity and ensure that mismatching types lead to an `unreachable` trap when indirectly called through a function index mismatch.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i64)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (type $sig1) (i32.const 42))
    (func $func2 (type $sig2) (i64.const 84))
    (func $test
      (call_indirect (type 0) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)
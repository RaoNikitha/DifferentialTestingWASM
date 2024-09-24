;; Test 7: Multiple `block` instructions containing `call` and `call_indirect` instructions with incorrect argument counts, testing stack integrity preservation and ensuring that any improper call-induced stack operations are correctly managed within blocks.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (type $t2 (func (param i32 i32) (result i32)))
    (func $f (param i32) (result i32) (i32.const 42))
    (table funcref (elem $f))
    (func $test 
      (block 
        (call $f (i32.const 1) (i32.const 2)) 
      )
      (block 
        (call_indirect (type $t1) (i32.const 0) (i32.const 1) (i32.const 2))
      )
    )
  )
  "type mismatch"
)
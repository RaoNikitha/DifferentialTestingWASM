;; Test 8: Develop a test where a block ends with multiple `br_if` instructions sequentially, each dependent on different local variables initialized with different values. Verify proper branch execution for each condition.

(assert_invalid
  (module 
    (func $test_br_if (local $x i32) (local $y i32) (local $z i32)
      (local.set $x (i32.const 1)) 
      (local.set $y (i32.const 0)) 
      (local.set $z (i32.const 1)) 
      (block (result i32) 
        (br_if 0 (local.get $x))
        (br_if 0 (local.get $y))
        (br_if 0 (local.get $z))
      )
    )
  )
  "type mismatch"
)
;; 8. Implement an `if` instruction with complex condition evaluation involving bitwise operations leading to true or false results. Verify that the `br_if` branches correctly based on the bitwise outcome. This checks for correct evaluation of complex conditional expressions.

(assert_invalid
 (module
  (func $complex_condition_bitwise (result i32)
   (i32.const 3)
   (i32.and
    (i32.const 1)
    (i32.xor (i32.const 7) (i32.const 2))
    (i32.eqz)
   )
   (if (result i32) (then (i32.const 0)) (else (i32.const 1)))
 )
)
 "type mismatch"
)
;; Test 8: Construct a loop where an `unreachable` appears after random arithmetic operations and ensure that the following conditional `br_if` changes the control flow as expected.

(assert_invalid
 (module (func $type-loop-unreachable-arithmetic-br_if
  (loop
   (i32.add)
   (i32.const 1)
   (unreachable)
   (br_if 0 (i32.const 0))
  )
 ))
 "type mismatch"
)
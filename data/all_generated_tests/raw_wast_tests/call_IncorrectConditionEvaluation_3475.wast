;; Test 4: Define a function that calls a different function, which returns multiple values one of which is a condition. Use `call` to execute this function and then use `br_if` to branch based on the returned condition.

(assert_invalid
 (module
  (func $check-condition (result i32 i32)
   i32.const 1
   i32.const 0)
  (func $use-condition
   (call $check-condition)
   i32.const 0
   (br_if 0)
   drop)
 )
 "type mismatch"
)
;; Test 1: Create a block that contains an instruction sequence where there is an attempt to pop more values than what is available on the stack. This should test operand stack underflow checking.

(assert_invalid
  (module (func $test-stack-underflow
    (i32.const 42)
    (block (result i32) 
      (drop) 
      (drop)
      (i32.const 1)
    )
  ))
  "stack underflow"
)
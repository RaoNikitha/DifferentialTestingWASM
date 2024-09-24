;; 1. Create a module that imports a function from another module. Inside a block, call this imported function and ensure that the block correctly resumes execution after the function returns. Check whether stack corruption occurs during the transition. Validate the result type compliance by comparing the operand stack before and after the block.

(assert_invalid
  (module
    (import "mod" "func" (func $imp (result i32)))
    (func $test (result i32)
      (block (result i32)
        (call $imp)
        (i32.const 1)
        (i64.add) 
      )
    )
  )
  "type mismatch"
)
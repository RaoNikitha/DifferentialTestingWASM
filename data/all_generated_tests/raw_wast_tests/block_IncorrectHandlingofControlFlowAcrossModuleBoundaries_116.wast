;; Create a block that performs a conditional branch (`br_if`) based on the result of an imported function call. Verify that the stack state remains consistent before and after the block, ensuring the conditional branch correctly influences the control flow across the module boundary.

(assert_invalid
 (module
  (import "env" "getCondition" (func $getCondition (result i32)))
  (func (result i32)
   (i32.const 42)
   (block (result i32)
    (call $getCondition)
    (br_if 0 (i32.const 1))
    (i32.const 43)
   )
  )
 )
 "type mismatch"
)
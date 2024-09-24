;; Test 1: Utilize a `br_table` instruction with a label vector where an out-of-bounds operand is explicitly placed at the top of the stack, ensuring it triggers the default label. Test for stack underflow by verifying if the stack is correctly unwound and reconfigured before and after the branch in both implementations.

(assert_invalid
  (module
    (func $out_of_bounds_operand 
      (block (result i32)
        (block (br_table 0 0 1 (i32.const 2))) 
        (i32.const 0)
      )
    )
  )
  "unknown label"
)
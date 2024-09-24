;; Test 6: Execute a `br_table` with the operand value exactly equal to the length of the label vector, which should trigger branching to the default label, ensuring the upper bound is correctly handled.

(assert_invalid
 (module
   (func $test6
     (block (br_table 0 1 2 3 (i32.const 4)))
   )
 )
 "index out of bounds"
)
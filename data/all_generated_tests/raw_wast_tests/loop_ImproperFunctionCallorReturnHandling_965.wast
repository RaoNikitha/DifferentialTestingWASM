;; Design a loop that initially branches to a label outside using `br` with a function call modifying the stack in between. Test if both correctively unwind the operand stack and reinitialize the loop after the branch.

(assert_invalid
 (module
  (func $test_loop
   (block $exit
    (loop $top
     (call $modify_stack)
     (br $exit)
     (drop)
    )
   )
  )
  (func $modify_stack
   (i32.const 42)
   (drop)
  )
 )
 "type mismatch"
)
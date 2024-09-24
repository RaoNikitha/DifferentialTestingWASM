;; **Test 8: Return from Loop Body**  Test a scenario where a return command is issued within a loop construct. Validate both CFG interpretations of loop terminations and returns within loops. Wizard Engine must properly exit looping constructs upon return, while WebAssembly's handling should maintain loop scope integrity within CFG boundaries.  _Check CFG behavior for returning from within loops and associated stack handling._

(assert_invalid
 (module
  (func $return-from-loop (result i32)
   (block (result i32)
    (loop (result i32)
     (return (i32.const 42))
    )
   )
  )
 )
 "type mismatch"
)
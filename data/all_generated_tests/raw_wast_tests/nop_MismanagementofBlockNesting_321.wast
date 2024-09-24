;; 2. **Test 2**: Validate the behavior of `nop` inside a `loop` within another `block`, where a `br` is used to exit the loop. Ensure that `nop` does not affect the loop and block exit paths.

(assert_invalid
 (module
  (func $test 
   (block $exit 
    (loop $loop 
     nop 
     (br $exit) 
    ) 
   ) 
  )
 )
 "type mismatch"
)
;; 4. **Test Unreachable After Function Call with Branch to Loop:**    - Place `unreachable` after a function call and use a `br` inside a loop which is intended to handle function's result.    - *Constraint*: Validates handling jump to loop start post function with `unreachable` inducing trap earlier.    - *Relation to Branch Resolution*: Ensures jumps to repetitive structures (loops) are accurately targeted.

(assert_invalid
 (module
  (func $test_unreachable_after_call_with_br_to_loop
   (call $some_func) 
   (loop
    (br 0)
    (unreachable)
   )
  )
 )
 "type mismatch"
)
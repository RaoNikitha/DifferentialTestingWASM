;; 1. **Test 1**: A simple loop with a `br_if` instruction that checks a non-zero condition to exit the loop. The condition evaluation should be correct; otherwise, in Wizard Engine, it could miss the exit condition.

(assert_invalid
 (module
  (func $test1 (loop $loop
   (block $exit (br_if $exit (i32.const 1)) (br $loop))
  ))
 )
 "type mismatch"
)
;; 10. Devise a sequence where a loop uses multiple `if` conditions to potentially break the loop. Place `unreachable` in such a way that it's hit only if all conditions fail. Validate that it results in a trap, not an infinite loop.

(assert_invalid
 (module
  (func $test-loop-if-unreachable
   (loop (if (i32.const 0) (br 1))
         (if (i32.const 0) (br 1))
         (if (i32.const 0) (br 1))
         (if (i32.const 0) (unreachable))))
 )
 "type mismatch"
)
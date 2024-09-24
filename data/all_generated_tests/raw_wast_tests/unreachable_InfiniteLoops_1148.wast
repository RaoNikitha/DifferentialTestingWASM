;; Test 9: Create a loop that combines `br` with `unreachable` within multiple nested loops, checking if the outer loop exits when the innermost loop traps.

(assert_invalid
 (module
  (func $test 
   (loop 
    (block 
     (loop 
      (br 1)
      (unreachable)
     )
    )
    (br 1)
   )
  )
 )
 "type mismatch"
)
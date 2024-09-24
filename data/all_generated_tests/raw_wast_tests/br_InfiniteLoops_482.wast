;; 3. A `loop` with multiple `br_if` instructions, ensuring each condition is evaluated correctly to exit the loop. Test that stack polymorphism handles all path conditions leading to proper loop termination, avoiding infinite loops.

(assert_invalid
 (module
  (func $test-loop-br_if
   (block $outer
    (loop $inner
     (br_if $outer (i32.eqz (i32.const 1)))
     (br_if $inner (i32.const 0))
     (i32.const 1)
    )
   )
  )
 )
 "type mismatch"
)
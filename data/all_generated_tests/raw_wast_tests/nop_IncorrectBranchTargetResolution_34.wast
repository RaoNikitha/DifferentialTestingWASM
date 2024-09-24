;; - Test Description 5: Write a function with several nested loops where `nop` instructions are inserted before `br_if` instructions inside the loops. Ensure that the `nop` does not cause branches to resolve to incorrect loop entries or exits.

(assert_invalid
  (module 
    (func $nested-loops 
      (loop $outer 
        (loop $inner 
          nop 
          (br_if $outer (i32.const 0)))
      )
    )
  )
  "type mismatch"
)
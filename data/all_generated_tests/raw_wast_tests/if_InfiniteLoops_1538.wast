;; 9. A test where `if` instruction contains a `br_if` in the `else` block to conditionally break middle of loop chains, testing that conditional branches prevent the infinite execution by correct condition evaluation.

(assert_invalid
 (module
  (func $test 
   (loop 
    (if (i32.const 0) 
     (then)
     (else (br_if 1 (i32.const 0)))
    )
   )
  )
 )
 "type mismatch"
)
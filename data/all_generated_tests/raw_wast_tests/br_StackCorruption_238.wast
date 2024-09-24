;; 9. Form a structure containing interleaved `block`, `loop`, and `if/else` constructs with complex operand dependencies, and employ a `br` instruction to target different outer constructs. Verify correct stack unwinding and stack height consistency across all control constructs, catching potential stack underflows or mismatches.

(assert_invalid
 (module
  (func $interleaved-constructs
   (block (result i32)
    (loop (result i32)
     (block
      (if (result i32)
       (i32.const 42)
       (then 
        (br 2)
       )
       (else
        (i32.const 1)
       )
      )
      (unreachable)
     )
    )
    (i32.mul (i32.const 10))
   )
  )
 )
 "type mismatch"
)
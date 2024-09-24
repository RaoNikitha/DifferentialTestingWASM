;; 5. Place a series of `nop` instructions just before and after a stack polymorphic instruction (like `unreachable`) inside an `if-else` construct to ensure the stack state before and after these instructions remains consistent.

(assert_invalid
  (module
    (func $test
      (if (i32.const 1)
        (then (nop) (unreachable) (nop) )
        (else (nop) (nop) )
      )
    )
  )
  "type mismatch"
)
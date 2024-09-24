;; 7. **Test 7: Conditional Branching in Complex Context**    - An `if-else` structure within a loop where conditional branching within the `else` block incorrectly jumps back to the loop.

(assert_invalid
  (module
    (func $conditional-branching-complex 
      (loop $outer_loop
        (i32.const 0) 
        (if (result i32) 
          (then 
            (i32.const 1)
          )
          (else 
            (br $outer_loop) ;; bushould be a break.
            (i32.const 1)
          )
        ) 
        (drop) 
      )
    )
  )
  "type mismatch"
)
;; 5. Use a complex nested `loop` structure where `nop` instructions are interspersed, and specific `br` instructions should exit the inner loop. Verify if control remains correct or results in infinite looping.

 ;; (module 
  (func $nested_loops
    (loop $outer
      (loop $inner
        nop
        br $inner
        nop
        br $outer
      )
    )
  )
)
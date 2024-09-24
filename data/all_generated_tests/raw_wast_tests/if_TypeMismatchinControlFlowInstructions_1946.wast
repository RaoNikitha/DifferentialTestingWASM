;; 7. Testing an `if` block in which a `br` (branch) instruction anticipates popping an `i32` from the stack while the current stack top is `f64`, causing a type mismatch during control flow redirection.

(assert_invalid
  (module 
    (func $type-mismatch-br 
      (block
        (if (i32.const 1) 
          (then
            (f64.const 0.0)
            (br 0) 
          ) 
          (else
            (i32.const 42)
          )
        )
      )
    )
  )
  "type mismatch"
)
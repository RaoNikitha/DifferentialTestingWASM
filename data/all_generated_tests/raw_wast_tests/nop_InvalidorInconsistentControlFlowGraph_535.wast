;; 6. Construct a control flow test with `nop` inside a `try`-`catch` block, ensuring that the CFG correctly handles exceptions, and observe any incorrect jumps to the `catch` block indicating error with `nop` integration.

(assert_invalid
  (module 
    (func $try-catch-nop 
      (try 
        (do 
          (nop)
        ) 
        (catch 
        )
      )
    )
  )
  "type mismatch"
)
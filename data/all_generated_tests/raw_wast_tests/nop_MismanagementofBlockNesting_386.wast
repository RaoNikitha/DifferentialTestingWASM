;; 7. **Nested `try-catch` with `nop` instructions:** Introduce `try` and `catch` blocks within each other interspersed with `nop`. Check for differential behavior in exception handling flows, ensuring `nop` does not impact the correct exception propagation or catching due to mishandled validation context initialization.

(assert_invalid
  (module
    (func $nested-try-catch
      (try 
        (do 
          (nop)
          (try
            (do 
              (nop)
              (if (i32.const 1)
                (then (nop))
                (else (nop))
              )
            )
            (catch
              (nop)
              (throw 0)
            )
          )
        )
        (catch
          (nop)
        )
      )
      (return)
    )
  )
  "unexpected instruction"
)
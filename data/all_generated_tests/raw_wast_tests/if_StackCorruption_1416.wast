;; 7. Multiple Nested Conditionals: Test multiple nested `if` instructions affecting stack management. ```wasm // Example (if   (then      (if       (then)       (else)     )   )   (else      (if        (then)       (else)     )   ) ) ``` *Reasoning*: Checks if each nested conditional correctly manages its own stack scope, avoiding stack corruption.

(assert_invalid
  (module
    (func $nested-conditionals
      (if (then
            (if (then)
                 (else)
            )
          )
          (else
            (if (then)
                 (else)
            )
          )
      )
    )
  )
  "type mismatch"
)
;; 10. Excessive Nested Operations: Test deep nested constructs or sequences of 'if' leading to complex stack manipulations. ```wasm // Example (block   (if      (then       (drop)       (if          (then            (drop)(drop)         )       )     )   ) ) ``` *Reasoning*: Checks if highly nested operations preserve stack integrity, ensuring no stack overflows or corruption due to deep nesting.

(assert_invalid
  (module
    (func 
      (block
        (if
          (then
            (drop)
            (if
              (then
                (drop) (drop)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
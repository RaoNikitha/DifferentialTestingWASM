;; 8. **Br within a Conditional in Loop**: Include a `br` instruction within an `if` conditional inside a loop where the `br` target may result in looping indefinitely if not correctly implemented. This ensures correct label indexing and structured control flow enforcement.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (if (result i32) ;; conditional inside loop
            (then
              (br 2 (local.get 0)) ;; branch out of loop and block
            )
            (else
              (local.get 0)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
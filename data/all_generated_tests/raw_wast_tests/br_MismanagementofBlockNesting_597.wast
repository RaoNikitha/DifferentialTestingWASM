;; 8. Test nested `if` and `loop` instructions where the `br` instruction targets a block outside the current conditional branch (e.g., `if (then (loop (br 2))) else (br 1)`). This checks if the implementation can correctly interpret the target label in conditional and loop contexts.

(assert_invalid
  (module
    (func
      (block (result i32) 
        (if (result i32) 
          (then 
            (loop (result i32) 
              (br 2)
            )
          ) 
          (else 
            (br 1)
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)
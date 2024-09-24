;; 3. Utilize a nested `block` with an `if-else` statement where the `br` instruction targets the `else` block (e.g., `block (if (then (br 1) else (br 2)))`). This checks if the implementation can correctly navigate conditional branches within nested blocks.

(assert_invalid
  (module
    (func
      (block
        (if (result i32)
          (then
            (br 1)
          )
          (else
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)
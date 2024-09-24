;; 2. Design a loop with a sequence of nested loops where an inner loop's branch incorrectly refers to an outer loop, causing mismatched label indices. This will verify if the framework correctly handles label scoping and index calculations.

(assert_invalid
  (module
    (func
      (loop
        (loop
          (br 2)
        )
      )
    )
  )
  "mismatched label indices"
)
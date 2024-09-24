;; 5. Design a nested block structure with mixed `if`, `loop`, and `block` instructions where the `br` instruction targets blocks at various nesting levels (e.g., `block (if (then (loop (br 2))))`). This tests the implementation's ability to resolve label indices correctly in complex nesting.

(assert_invalid
  (module
    (func $test-br-complex-nesting
      (block 
        (if (then 
          (loop 
            (block 
              (br 2)
            )
          )
        ))
      )
    )
  )
  "unknown label"
)
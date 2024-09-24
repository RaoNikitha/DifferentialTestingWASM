;; 5. Test a nested combination of `block`, `loop`, and another `block`, with `br` targeting the outermost `block` from within the innermost `block`. This test ensures correct label indexing across mixed structured control instructions, focusing on **complex nested resolution**.

(assert_invalid
  (module (func $complex-nested-resolution
    (block 
      (loop 
        (block 
          (br 2)
        )
      )
    )
  ))
  "unknown label"
)
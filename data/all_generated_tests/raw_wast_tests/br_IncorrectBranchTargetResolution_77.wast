;; 8. Design a sequence of nested blocks and loops with the `br` targeting a label index shared among an outermost block and innermost loops. Ensure the label resolution identifies the correct block across the mixed constructs.

(assert_invalid
  (module
    (func
      (block (block (loop (br 3))))
    )
  )
  "unknown label"
)
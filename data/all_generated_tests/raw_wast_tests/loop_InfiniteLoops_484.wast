;; 5. **Test Loop Label Indexing**: A loop nested within another loop, with each loop having its own `br` targets. Validate that branch labels are managed correctly to prevent infinite looping in the inner loop while expecting to exit based on outer loop’s label.

(assert_invalid
  (module
    (func $test-loop-label-indexing
      (loop (block $outer
        (loop (block $inner
          (br $inner) ;; This should jump to the start of the inner loop
          (br $outer) ;; This should exit the inner loop and jump to the outer loop
        ))
      ))
    )
  )
  "label index out of range"
)
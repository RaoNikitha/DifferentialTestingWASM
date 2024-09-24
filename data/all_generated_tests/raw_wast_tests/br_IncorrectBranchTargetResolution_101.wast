;; 2. **Test Incorrect Nesting Depth Calculation:**    - Create a deeply nested structure with multiple blocks and loops. Use `br` to jump several levels outward. The test checks for accurate computation of relative depths and correct label resolution.

(assert_invalid
  (module (func $incorrect-nesting-depth-calculation
    (block 
      (block
        (block
          (loop
            (block (br 5)) ;; Testing incorrect label resolution leading to an unknown label error
          )
        )
      )
    )
  ))
  "unknown label"
)
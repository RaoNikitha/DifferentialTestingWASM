;; 1. **Test `nop` in Nested Loops**:    Insert multiple `nop` instructions within nested loops to see if the loop control structures remain unaffected.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop
          (nop)
          (loop
            (nop)
            (br 1) ;; Breaks out of the inner loop
          ) ;; end inner loop
          (nop)
          (br 0) ;; Breaks out of the outer loop
        ) ;; end outer loop
        (nop)
      ) ;; end block
    )
  )
  "invalid loop structure"
)
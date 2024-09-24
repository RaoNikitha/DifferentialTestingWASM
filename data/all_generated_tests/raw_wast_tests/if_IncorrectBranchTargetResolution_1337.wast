;; 8. **Inline `else` and Incorrect Label Target**:    - Have an `else` block inlined within an instruction sequence that mis-targets a label beyond the correct scope.    - Tests validation of inline blocks handling with immediate jump targets.    - Ensures that inline handling within scope is strictly enforced.

(assert_invalid
  (module 
    (func $inline-else-incorrect-label 
      (block 
        (if (i32.const 1) 
          (then (br 1)) 
          (else (block (br 2))) 
        )
      )
    )
  )
  "invalid label"
)
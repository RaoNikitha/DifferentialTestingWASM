;; 7. **Nested Loop with Non-Matching Result Types**:    Design a test involving nested `loops` where the result types don't match the expected types when branching occurs. This ensures the implementation checks for type consistency and raises appropriate errors for mismatched types during loop execution and control transfer within the nested environment.

(assert_invalid
  (module
    (func 
      (loop (result i32) 
        (loop (result f64)
          br 1
        )
      )
    )
  )
  "type mismatch"
)
;; 4. **Test: Nested `if` with Conflicting Labels**:    - **Description**: Have nested `if` instructions where both contain `br` instructions targeting label `0`, mixing label targets in a complex scope.    - **Constraint**: Confirms that label targets are resolved based on the correct nesting depth.    - **Relation to Branch Target Resolution**: Evaluates if the label indices are correctly interpreted within their respective nested scopes.

(assert_invalid
  (module
    (func $nested-conflicting-labels
      (block
        (if (result i32)
          (i32.const 1)
          (then
            (if (result i32)
              (i32.const 1)
              (then
                (br 0 (i32.const 1))
              )
              (else
                (br 0 (i32.const 2))
              )
            )
          )
          (else
            (br 0 (i32.const 3))
          )
        )
      )
    )
  )
  "label target mismatch"
)
;; 8. **Test for Intersection of Labels in Consecutive `if-else` Constructs**:    Create several `if-else` constructs one after another, using `br` instructions to jump between them. This tests consistent label resolution when `if-else` constructs are aligned.    - **Constraint**: Validate label consistency and accurate branching between adjacent constructs.    - **Expectation**: Branches should resolve correctly without overlapping to the wrong construct.

(assert_invalid
  (module (func $consecutive-if-else-labels (result i32)
    (block (result i32)
      (if (result i32) (i32.const 0)
        (then (br 1))
        (else (i32.const 1))
      )
      (if (result i32) (i32.const 1)
        (then (br 1))
        (else (i32.const 2))
      )
    )
  ))
  "type mismatch"
)
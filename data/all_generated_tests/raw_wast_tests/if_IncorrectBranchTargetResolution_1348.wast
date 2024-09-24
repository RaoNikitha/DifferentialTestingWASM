;; 9. **Misleading Scope of Labels in Overlapping Contexts**:    - Generate an `if` sequence where nested and sibling `if` blocks share similar label indices. Test label resolution to ascertain that `br` instructions don’t cross intended boundaries, ensuring unique scope preservation.    - **Constraint**: Verify label index reuse within independent scopes doesn’t lead to incorrect cross-boundary jumps.

(assert_invalid
  (module
    (func $misleading-scope-labels
      (block $outer
        (if (i32.const 0) 
          (then 
            (block $inner
              (br $inner)
            )
          ) 
          (else
            (br $inner)
          )
        )
      )
    )
  )
  "unknown label"
)
;; 9. **Test Description 9:**    - **Focus:** Handling multi-level nested control structures with module imports.    - **Constraint:** Verify that multi-level nesting with `br` instructions maintains correct control flow when crossing module boundaries.    - **Incorrect Handling:** Incorrect label indexing or stack state in multi-level nestings.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $multi-level-nesting
      (block
        (block
          (block
            (call $externalFunc)
            (br 1)
          )
          (nop)
        )
        (br 3)
      )
    )
  )
  "unknown label"
)
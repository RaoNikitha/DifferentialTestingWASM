;; 3. **Test Description**: Construct a sequence of nested `block` structures where a `br_if` conditionally targets an outer `block`. Validate that the correct outer `block` is targeted.    - **Constraint Checked**: Handling of multiple nested `block` labels.    - **Related Issue**: Ensure correct relative indexing to outer `block` labels.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)
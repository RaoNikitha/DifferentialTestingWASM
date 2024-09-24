;; 10. **Incorrect Nested Control Flow Test**:     - Set up a series of nested `block`, `loop`, and `if` constructs, using `br` to target different relative depths conflicting with structured control flow rules. Verify branches result in predictable errors or correctly traverse control structures, correcting any misinterpreted label indices.

(assert_invalid
  (module
    (func $incorrect-nested-control
      (block
        (loop
          (if
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)
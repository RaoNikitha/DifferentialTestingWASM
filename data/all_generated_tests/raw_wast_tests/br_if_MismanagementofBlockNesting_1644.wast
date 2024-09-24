;; 5. **Test 5: Deeply Nested Control Structures**    - **Description:** Multiple levels of nested structures (blocks within loops within ifs) culminating in a `br_if` that targets an outer loop.    - **Constraint Checked:** Handling of deeply nested control structure branching.    - **Mismanagement Relation:** Ensuring that deeply nested structures maintain correct label and indexing for branches.

(assert_invalid
  (module
    (func $deeply_nested
      (block
        (loop
          (if (i32.const 1)
            (then
              (block
                (br_if 1 (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)
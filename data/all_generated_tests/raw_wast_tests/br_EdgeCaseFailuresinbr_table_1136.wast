;; 7. **Transition from `loop` to `block`:**    - Construct `br_table` nested within loops and blocks, testing various edge indices to verify branching behavior transitions correctly between structural elements.    - **Constraint:** Ensures consistency and correctness in control flow between nested control structures.

(assert_invalid
  (module (func $nested-loop-block
    (block
      (loop
        (block
          (br_table 0 1 2 3)
        )
      )
    )
  ))
  "unknown label"
)
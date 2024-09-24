;; 6. **Branching With Hidden Depth (Deeply Nested Incorrect Targets):**    - Develop a deeply nested structure with a `br` instruction that targets an out-of-scope loop.    - **Constraint Checked:** Label indexing and control flow nesting.    - **CFG Impact:** If the label target is miscomputed, it could incorrectly adjust paths in the CFG making certain paths invalid.

(assert_invalid
  (module
    (func $deep-nested-br
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br 9)))))))))))
  "unknown label"
)
;; 7. **Test Description:**    - Create a nested control structure containing an empty `block` followed by another `block` with a `br` instruction targeting the outer `block`.    - **Constraint:** Ensure that the branch correctly identifies the outer `block`, even when intermediate blocks are empty.    - **CFG Check:** Tests the CFG’s robustness in handling labels in presence of empty intermediate control constructs.

(assert_invalid
  (module
    (func $test-nested-empty-block-branch
      (block
        (block
          (block
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)
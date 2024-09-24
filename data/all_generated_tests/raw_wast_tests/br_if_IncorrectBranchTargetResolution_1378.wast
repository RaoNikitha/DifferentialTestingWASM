;; 9. **Test Description 9: Non-Nested Branch Confusion**    - Construct multiple non-nested `block` instructions and introduce `br_if`, ensuring it does not incorrectly resolve indices in overlapping contexts but refers to the immediate `block`.

(assert_invalid
  (module
    (func $non-nested-branch-confusion
      (block (block (br_if 1 (i32.const 1))))
    )
  )
  "unknown label"
)
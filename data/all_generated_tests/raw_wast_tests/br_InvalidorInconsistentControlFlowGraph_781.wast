;; 2. **Test Description:**    - Implement a control structure with a `loop` containing a `block`, including a `br` instruction targeting the loop.    - **Constraint:** Confirm that the branch returns to the start of the `loop` as expected.    - **CFG Check:** The backward jump to the `loop`’s beginning validates correct CFG formation and loop handling.

(assert_invalid
  (module
    (func (loop (block (br 1))))
  )
  "type mismatch"
)
;; 4. **Test Description:**    - Create a complex structure containing multiple nested `loop` and `block` constructs with a deep nesting level and a `br` instruction targeting the outermost `block`.    - **Constraint:** Validate that the deeply nested labels are correctly indexed and referenced.    - **CFG Check:** Tests the CFG’s ability to manage and resolve deep nesting label indexes without errors.

(assert_invalid
  (module (func
    (block (block (block (block (block (block (block (block
      (br 7)
    ))))))))
  ))
  "unknown label"
)
;; 3. **Test Description:** Implement a `br_table` within nested blocks, where relative indexing is crucial. Ensure a label index references an outer block. The test checks for the correct translation of relative indices in nested conditions, exposing potential misinterpretation of the control flow rules.

(assert_invalid
  (module (func $nested-relative-indexing
    (block (block (block 
      (br_table 2 1 0 (i32.const 0))
    )))
  ))
  "unknown label"
)
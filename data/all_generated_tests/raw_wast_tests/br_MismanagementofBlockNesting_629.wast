;; 10. **Test 10**: Develop a function that includes several nested control constructs with varying depths, then have a complex `br_table` instruction that references labels at different depths inaccurately. This tests the implementation's management of misinterpreting label depth in nested structures, ensuring proper handling of branching instructions.

(assert_invalid
  (module (func
    (block (block (block (br_table 0 1 2 3 4 (i32.const 3)))))
  ))
  "unknown label"
)
;; 4. **Test Name: Improperly Nested Loop Control Structures**    **Description:** Develop a sequence where `br_if` is used inside improperly nested control structures. This would lead to invalid label context handling.    **Infinite Loop Relation:** If the nesting is not correctly resolved, it might cause the loop to fail to exit as intended, leading to infinite looping.

(assert_invalid
  (module
    (func $improperly-nested (block (loop $loop1 (block $block1 (br_if 1 (i32.const 1)))) (br $loop1)))
  )
  "improperly nested"
)
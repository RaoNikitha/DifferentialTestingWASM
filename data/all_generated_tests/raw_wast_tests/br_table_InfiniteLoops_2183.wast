;; 3. **Test 3: Unreachable Nested Loop with `br_table`**    - **Description**: Nest a loop within another loop, with the inner loop containing a `br_table` instruction referring to labels in the outer loop. Ensure conditions maintain an endless inner loop.    - **Constraint**: This tests the proper label scope resolution.    - **Infinite Loop Relation**: Misinterpretation of label scope can cause the inner loop to never correctly target the outer loop's exit, thus running indefinitely.

(assert_invalid
  (module
    (func (block (loop (loop (br_table 1 1 (i32.const 0))))))
  )
  "unknown label"
)
;; 10. **Test Name: Nested Loop with Recursive br_if**    **Description:** Set up a nested loop scenario where a recursive `br_if` instruction incorrectly handles nested labels and branching.    **Infinite Loop Relation:** Recursive mismanagement of labels in nested loops prevents proper loop exits, leading to endless looping if not correctly resolved.

(assert_invalid
  (module
    (func $nested_loop_recursive_br_if
      (block (loop (block (loop (br_if 1 (i32.const 1)) (br_if 2 (i32.const 1))))))
    )
  )
  "unknown label"
)
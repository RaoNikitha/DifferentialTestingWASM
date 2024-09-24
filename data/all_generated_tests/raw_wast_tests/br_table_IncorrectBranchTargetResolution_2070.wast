;; 10. **Test Description:** Craft a `br_table` instruction with labels pointing to different control constructs (loop, block, if), verifying that branching happens correctly, respecting the structured control flow rules.    - **Constraint Checked:** Adheres to structured control flow branching.    - **Relation to Incorrect Branch Target Resolution:** Misunderstanding control flow rules could invalidate branching, leading to skipped or unexpected code paths.

(assert_invalid
  (module
    (func $br_table_structured_control_flow
      (block (result i32)
        (i32.const 0)
        (br_table 0 1 2 (i32.const 2))
      )
      (block)
      (loop (br 1))
      (if (i32.const 1) (then))
    )
  )
  "type mismatch"
)
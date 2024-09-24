;; 2. **Test Description**: A nested block with a `br_table` that incorrectly interprets the depth of nested blocks.    **Constraint**: Ensuring correct branching instructions that target nested blocks by depth.    **Relation to Mismanagement**: Checks if the `br_table` instruction can correctly identify and jump to the specified block level.    ```    block    ;; level 0      block  ;; level 1        br_table 0  ;; should branch to level 0 but misinterpreted as level 1      end    end    ```

(assert_invalid
  (module (func
    (block
      (block
        (br_table 0)
      )
    )
  ))
  "incorrect br_table interpretation of nesting depth"
)
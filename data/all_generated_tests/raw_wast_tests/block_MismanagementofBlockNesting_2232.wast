;; 3. **Test Description**: A nested block with a `br_if` instruction trying to exit to an outer block with incorrect depth handling.    **Constraint**: Correct indexing and depth counting for conditional branches within nested blocks.    **Relation to Mismanagement**: Ensures the `br_if` does not cause erroneous control flow by miscounting nesting depth.    ```    block    ;; level 0      block  ;; level 1        br_if 2  ;; expecting to return to level 0, check mismanagement by depth      end    end    ```

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (br_if 2 (i32.const 1))
        )
      )
    )
  )
  "invalid depth"
)
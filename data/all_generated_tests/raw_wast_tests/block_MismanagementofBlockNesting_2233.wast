;; 4. **Test Description**: Deeply nested blocks with branching at multiple levels to check if the `end` instruction correctly matches the opening `block`.    **Constraint**: Proper pairing and nesting of `block` and `end` instructions.    **Relation to Mismanagement**: Tests the implementation's ability to correctly manage multiple nested levels.    ```    block    ;; level 0      block  ;; level 1        block  ;; level 2          br 1        end      end    end    ```

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (br 1)
          end)
        end)
      end)
    )
  )
  "inline function type"
)
;; 6. **Test Description**: Using `br_table` across multiple nested blocks with a mix of valid and invalid depths.    **Constraint**: Correct handling of the branch table when targeting various depths within nested blocks and catching out-of-bounds depths.    **Relation to Mismanagement**: Validates if the `br_table` correctly interprets depth and identifies invalid indices.    ```    block    ;; level 0      block  ;; level 1        br_table 0 0 3  ;; out-of-bounds depth      end    end    ```

(assert_invalid
  (module (func
    block
      block
        br_table 0 0 3
      end
    end
  ))
  "type mismatch"
)
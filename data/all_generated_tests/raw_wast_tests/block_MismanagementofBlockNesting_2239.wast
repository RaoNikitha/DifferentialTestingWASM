;; 10. **Test Description**: Blocks containing complex nested control flow with `br`, `br_if` and `br_table` creating potential for misinterpretation.     **Constraint**: Complex control flow within nested blocks requiring accurate management and depth counting.     **Relation to Mismanagement**: Tests for correct handling of mixed control-flow instructions within highly nested blocks.     ```     block    ;; level 0       block  ;; level 1         br_if 2       end       block  ;; level 1         br_table 0 1       end     end     ```

(assert_invalid
  (module (func
    (block
      (block
        (br_if 2)
      )
      (block
        (br_table 0 1)
      )
    )
  ))
  "invalid branch depth"
)
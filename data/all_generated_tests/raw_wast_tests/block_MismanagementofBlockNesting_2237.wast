;; 8. **Test Description**: Branching to a block with valid out-of-order indices to see if the implementation skips the correct block depth.    **Constraint**: Correctly ordering block indices and managing them across nested structures.    **Relation to Mismanagement**: Ensures branching instructions within nested blocks maintain proper depth order.    ```    block    ;; level 0      block  ;; level 1        block  ;; level 2          br 1  ;; should target level 1 but checks for mismanagement        end      end    end    ```

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 1)
          )
        )
      )
    )
  )
  "invalid branch"
)
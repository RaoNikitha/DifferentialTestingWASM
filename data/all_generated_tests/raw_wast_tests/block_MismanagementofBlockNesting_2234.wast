;; 5. **Test Description**: Explicative blocks with loops that might cause issues in differentiating block levels.    **Constraint**: Correctly differentiating between blocks and loop constructs, especially with nested `loop` and `block`.    **Relation to Mismanagement**: Ensures nested loops within blocks are correctly managed and terminated.    ```    block    ;; level 0      loop    ;; level 1        block  ;; level 2          br 2        end      end    end    ```

(assert_invalid
  (module
    (func
      (block
        (loop
          (block 
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)
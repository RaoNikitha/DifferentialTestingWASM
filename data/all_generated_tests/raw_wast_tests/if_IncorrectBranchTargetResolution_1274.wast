;; 5. **Branching from inner loop to outer if**: Set up an `if` block surrounding a loop containing a `br` instruction incorrectly targeting the outer `if` block, which should be invalid.    ```    (block       (if (i32.const 1)        (loop $inner          (br $if)        )      )    )    ```

(assert_invalid
  (module
    (func $branch-target-if
      (block
        (if (i32.const 1)
          (loop $inner
            (br $if)
          )
        )
      )
    )
  )
  "branch target invalid"
)
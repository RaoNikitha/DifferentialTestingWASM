;; 7. **Incorrectly Scoped Loop Target:**    Write a nested loop where a `br` instruction within an inner `block` tries to jump to a loop label declared in an outer scope but improperly indexed. Ensure the test exposes this label misresolution.

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
  "invalid label"
)
;; 3. **Test Missing Handling of Unreachable Code:**    - Include an unreachable branch target that should never be resolved. This tests if the `br` instruction correctly skips unreachable labels during resolution.

(assert_invalid
  (module
    (func $unreachable-handler
      (i32.const 0) 
      (block
        (block 
          (br 2)
          (unreachable)
        )
      )
    )
  )
  "invalid label"
)
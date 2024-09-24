;; 4. **Nested Blocks with Multiple Unreachable Instructions:**    - Create deeply nested blocks with multiple `unreachable` instructions placed at different levels. This verifies if all levels correctly handle the unreachable traps and do not continue execution in any nested block after encountering `unreachable`.

(assert_invalid
  (module 
    (func $nested-unreachables
      (block 
        (block 
          (block 
            (unreachable)
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
      (i32.const 4)
    )
  )
  "type mismatch"
)
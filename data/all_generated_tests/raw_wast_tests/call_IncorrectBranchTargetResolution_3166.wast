;; 5. **Test Description**: Call a function that performs a nested loop within a block and includes a `br` instruction targeting the outer block, then verifies resultant stack state.    - **Constraint**: Tests accurate branch target resolution for nested control structures.

(assert_invalid
  (module
    (func $outer (result i32)
      (block
        (loop (result i32)
          (i32.const 5)
          (call $inner)
          (br 1))
      )
    )
    (func $inner (result i32)
      (i32.const 10)
    )
  )
  "type mismatch"
)
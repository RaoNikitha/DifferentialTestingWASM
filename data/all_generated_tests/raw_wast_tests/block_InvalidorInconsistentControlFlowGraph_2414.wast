;; Test 5: Write a block with a deep nesting structure where multiple nested blocks include branches that jump multiple layers up. Ensure the CFG correctly manages multiple label contexts.

(assert_invalid
  (module (func $deep-nesting-br (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 3 (i32.const 42))
          )
        )
      )
    )
  ))
  "type mismatch"
)
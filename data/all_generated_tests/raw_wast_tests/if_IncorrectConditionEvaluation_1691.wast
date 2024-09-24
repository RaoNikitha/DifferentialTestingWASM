;; 2. **Test Description**: Create an `if` block with a nested `br_if` instruction that triggers a forward branch only if the condition is true. This verifies the proper condition evaluation and the handling of forward branches within an `if` block.

(assert_invalid
  (module
    (func $test
      (i32.const 1)
      (if (result i32)
        (then
          (br_if 0 (i32.const 1))
          (i32.const 0)
        )
        (else
          (i32.const 0)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)
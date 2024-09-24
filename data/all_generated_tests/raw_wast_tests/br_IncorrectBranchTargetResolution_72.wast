;; 3. Implement a nested structure with multiple if-else blocks, and use the `br` instruction to target an enclosing `else` block. Ensure the `br` does not incorrectly jump to the corresponding `then` block or any subsequent block.

(assert_invalid
  (module
    (func $nested-if-else
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 2)
          (block (result i32)
            (br 1)
          )
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)
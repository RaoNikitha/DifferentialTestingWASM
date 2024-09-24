;; 3. **Unreachable in Overly Nested Blocks to Challenge Stack Handling**:    - Construct a deeply nested series of blocks with distinct block types and have the innermost block contain an `unreachable` instruction. Add a branching instruction that references incorrectly handled context stacks, leading to the `unreachable` instruction.

(assert_invalid
  (module (func $nested-blocks-unreachable (result i32)
    (block (result i32)
      (block (result f64)
        (block (result i32)
          (block (result f64)
            (block (result i32)
              (unreachable)
            )
            (br_if 0 (i32.const 1))
          )
          (i32.const 0)
        )
        (i32.trunc_f64_s (f64.const 2.5))
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)
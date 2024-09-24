;; 10. **Branching with Different Type across Non-matching Block:**     - Design a `block` that enforces `i64` inputs and has a nested `block` returning `f32`. Use `br` to misalign the types between these blocks. This ensures types are enforced correctly across branches in incompatible blocks.

(assert_invalid
  (module
    (func (result i32)
      (block (result i64)
        (block (result f32)
          (br 1 (i64.const 42))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
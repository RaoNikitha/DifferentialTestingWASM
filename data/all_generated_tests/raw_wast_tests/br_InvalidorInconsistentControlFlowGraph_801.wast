;; 2. **Unbalanced Operand Stack Test:**    Nest multiple blocks and use a `br` instruction to target an outer block. Place different operand types on the stack before the branch. This checks whether the engine correctly balances the stack upon branching.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 1) (i32.const 2)
        (block (result i32 f32)
          (br 1)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)
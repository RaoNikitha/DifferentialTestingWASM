;; 5. **Conditional Branch Mismatch**:    Within a loop, utilize a `br_if` instruction targeting a label that should be resolved to the current loop but incorrectly references an outer block, testing conditional branch target management.

(assert_invalid
  (module
    (func $conditional-branch-mismatch
      (block $outer
        (loop $inner (result i32)
          (i32.const 1)
          (br_if $outer (i32.const 2))
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)
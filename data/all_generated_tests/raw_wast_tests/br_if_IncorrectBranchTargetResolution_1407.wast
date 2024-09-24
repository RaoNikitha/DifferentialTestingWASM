;; 8. **Test Description**: Create a `block` that includes both a nested `loop` and another nested `block`, with `br_if` conditioned to jump to the nested `block`. Confirm correct branching.    - **Constraint Checked**: Handling branching to intermediate nested `block`.    - **Related Issue**: Correctly allowing branches to intermediate labels within nested structures.

(assert_invalid
  (module (func
    (block $outer
      (loop $inner
        (block $nested
          (br_if $nested (i32.const 1))
        )
      )
    )
  ))
  "type mismatch"
)
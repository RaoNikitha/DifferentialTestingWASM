;; 1. **Missed Internal Label in Nested Block**:    - Create a deeply nested `if` block where an internal label is targeted by a `br` instruction. The test ensures the label resolves correctly within the `then` block without mis-branching to outer labels. This checks for the proper maintenance of label context within nested `if` blocks.    - **Constraint**: Labels must be resolved within the correct nested context without escaping to outer blocks.

(assert_invalid
  (module (func $missed-internal-label-in-nested-block
    (block $outer
      (if (result i32)
        (i32.const 1)
        (then
          (block $inner
            (drop)
            (br $inner)
          )
          (i32.const 1)
        )
        (else
          (i32.const 2)
        )
      )
    )
  ))
  "label out of bounds"
)
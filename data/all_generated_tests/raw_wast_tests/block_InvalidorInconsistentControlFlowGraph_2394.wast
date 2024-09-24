;; 5. **Test interleaved nested blocks and invalid usage of `br_if` leading to unreachable code sections**:    - **Constraint Checked**: Verifies whether nested blocks and conditional branching composition is correctly handled.    - **Reasoning**: Unreachable code sections due to improper `br_if` usage can mar CFG integrity.

(assert_invalid
  (module (func $interleaved-nested-blocks-brif-unreachable (result i32)
    (block (result i32)
      (block $inner (result i32)
        (i32.const 1)
        (i32.const 1)
        (br_if 1)
        (br_if $inner)
      )
      (unreachable)
    )
  ))
  "type mismatch"
)
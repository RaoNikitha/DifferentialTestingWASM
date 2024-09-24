;; 8. Set up a block instruction where `br_if` relies on the comparison between a local variable and a stack value, ensuring comparison is false. Validate if branching happens erroneously, pointing to failures in operational condition checks.

(assert_invalid
  (module (func $type-block-br_if-comparison (local i32) (result i32)
    (block (result i32)
      local.get 0
      i32.const 0
      i32.eq
      br_if 0
      (i32.const 1)
    )
  ))
  "type mismatch"
)
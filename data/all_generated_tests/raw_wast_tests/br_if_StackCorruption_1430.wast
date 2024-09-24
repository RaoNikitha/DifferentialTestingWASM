;; 1. A test with a `block` that requires two `i32` values on the stack, followed by a `br_if` targeting the block within another nested block. Check if the stack unwinding preserves only the required two `i32` values.

(assert_invalid
  (module
    (func $nested-blocks
      (block (result i32 i32)
        (i32.const 42)
        (i32.const 43)
        (block
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)
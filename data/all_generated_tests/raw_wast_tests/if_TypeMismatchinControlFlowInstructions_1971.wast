;; Test 2: Use a `block` instruction within an `if` block, where the `block` produces an `i32` output, but the `if` block type is defined to expect an `f32` output.

(assert_invalid
  (module (func $block_result_type_mismatch (result f32)
    (if (result f32) (i32.const 1)
      (then (block (result i32) (i32.const 1) (i32.const 2)))
      (else (f32.const 1.0))
    )
  ))
  "type mismatch"
)
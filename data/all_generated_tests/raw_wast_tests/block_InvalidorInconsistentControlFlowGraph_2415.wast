;; Test 6: Insert a `br_if` instruction inside a block that conditionally branches to an outer block based on the top stack element. Verify the operand stack's state handling when the branch is not taken.

(assert_invalid
  (module (func $block-with-br_if-value-stack
    (block $outer (result i32)
      (i32.const 0)
      (block $inner (result i32)
        (i32.const 1)
        (br_if $outer (i32.const 0))
      )
    )
  ))
  "type mismatch"
)
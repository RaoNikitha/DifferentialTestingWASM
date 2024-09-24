;; - **Test 4 Description**:   Construct a `block` instruction sequence where a `br_if` causes a type mismatch by branching to a label with an incorrect operand type (`br_if` expects `i32`, but a different type is branched). This test will expose any discrepancies in handling branches within blocks.

(assert_invalid
  (module
    (func $block-with-br_if-type-mismatch
      (block (result i32)
        (i32.const 1)
        (br_if 0 (f64.const 0.0))
      )
    )
  )
  "type mismatch"
)
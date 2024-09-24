;; 6. Construct a block with an internal `if-else` block where the `br_if` instruction decides branching based on an `i32.and` operation. The test checks if the logical AND operation is correctly evaluated to control flow.

(assert_invalid
  (module (func $internal-if-else-br_if (result i32)
    (block (result i32)
      (i32.const 1)
      (i32.const 1)
      (i32.and)
      (br_if 0 (i32.const 0))
      (i32.const 2)
    )
  ))
  "type mismatch"
)
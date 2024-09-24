;; Test 2: A `loop` block containing `br_if` instruction that branches based on a condition, where the block's expected type is `[] -> [f32]`, but the `br_if` condition is of type `i32`. This tests the handling of type consistency for conditional branching within loops.

(assert_invalid
  (module (func $type-mismatch-br_if-loop
    (result f32)
    (loop (result f32)
      (i32.const 1)
      (br_if 0)
    )
  ))
  "type mismatch"
)
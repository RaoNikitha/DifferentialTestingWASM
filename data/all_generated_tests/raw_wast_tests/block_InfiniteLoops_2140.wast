;; Test Description 1: Create a block with multiple inner loops where each inner loop contains a `br_if` conditional branch targeting the `block` label. The condition for the `br_if` should be falsified intentionally to ensure the loops keep executing indefinitely if the label indexing is mishandled.

(assert_invalid
  (module (func $test
    (block
      (loop (br_if 0 (i32.const 0)))
      (loop (br_if 0 (i32.const 0)))
      (i32.const 1)
    )
  ))
  "type mismatch"
)
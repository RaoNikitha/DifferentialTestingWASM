;; 10. Design a test with a `br_if` instruction that conditionally jumps into a `loop` with mismatched label references, verifying that control flow accurately identifies and corrects branch target misalignments for complex loops.

(assert_invalid
  (module
    (func $complex-loop-mismatch
      (block
        (loop (block (br_if 1 (i32.const 1))))
      )
    )
  )
  "unknown label"
)
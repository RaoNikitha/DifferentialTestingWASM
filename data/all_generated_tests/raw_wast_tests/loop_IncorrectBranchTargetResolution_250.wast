;; Test 1: A nested loop structure where the inner loop has a backward branch targeting the outer loop. If the branch target resolution is incorrect, it will jump to the wrong block and execute an unexpected sequence.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (loop (result i32)
          (br 1)
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
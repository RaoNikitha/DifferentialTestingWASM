;; Test 1: Define a deep nested structure with multiple `if` blocks followed by nested `loop` blocks. Verify if the branches and flow control within the `if` and `loop` blocks manage stack coherence without jumping into unintended blocks, particularly focusing on the condition propagation at different depths.

(assert_invalid
  (module
    (func $deep-nested-structure
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (then
          (i32.const 0)
          (loop (result i32)
            (i32.const 2)
            (if (result i32)
              (i32.const 3)
              (then
                (i32.const 4)
              )
              (else
                (i32.const 5)
              )
            )
          )
        )
        (else
          (i32.const 6)
        )
      )
    )
  )
  "type mismatch"
)
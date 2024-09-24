;; Implement a nested loop structure with conditional branches (`br_if`) targeting the inner loop. The inner loop should be terminated correctly in WebAssembly but will incorrectly branch outside in Wizard Engine due to label mismanagement.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (loop (result i32)
            (i32.const 0)
            (br_if 0 (i32.const 1))
            (br 1)
          )
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)
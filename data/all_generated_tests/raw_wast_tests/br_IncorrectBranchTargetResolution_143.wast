;; Implement a forward branch from within a deeply nested loop structure targeting an adjacent block with mismatching operand types, testing if the branch resolution and operand stack management detect and handle type mismatches correctly.

(assert_invalid
  (module
    (func $nested-loop-forward-branch
      (block
        (loop
          (block (result i32)
            (br 1 (f32.const 1.0))
          )
        )
      )
    )
  )
  "type mismatch"
)
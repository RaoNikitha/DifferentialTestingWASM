;; 8. A conditional `if` inside an `if` within an overall block structure, where the `else` part includes a `block` and a loop. This tests the structural consistency of conditional and looped branches within different parts of the nested hierarchy.

(assert_invalid
  (module
    (func $nested-conditional-loop (result i32)
      (block (result i32)
        (if (result i32) (i32.const 1)
          (then
            (if (i32.const 1)
              (then (i32.const 42))
            )
          )
          (else
            (block (result i32)
              (loop (result i32)
                (i32.const 0)
                (br_if 0 (i32.const 0))
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
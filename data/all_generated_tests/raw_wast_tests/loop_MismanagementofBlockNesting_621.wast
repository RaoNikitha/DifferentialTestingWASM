;; 2. **Conditional Branch in Nested Loop**: Design a loop where the inner loop contains nested `if` blocks with branches (`br_if`) targeting both the `if` blocks and the inner `loop`. This tests if the implementation correctly handles branch instructions within nested structures and verifies the scope of branch targets.

(assert_invalid
  (module
    (func $nested_loop_with_br_if
      (i32.const 0)
      (loop (param i32)
        (loop (param i32)
          (if (result i32)
            (i32.const 0)
            (then (i32.add (br_if 0 (i32.const 1)) (i32.const 1)))
            (else (br_if 1 (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)
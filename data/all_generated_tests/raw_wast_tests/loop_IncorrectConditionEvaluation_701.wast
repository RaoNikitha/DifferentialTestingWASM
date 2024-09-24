;; 2. Design a loop with multiple `br_if` instructions, each with different conditions (true and false). Verify that branches are taken only when their conditions evaluate to true, ensuring no false branch triggers a break.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 0)
        (br_if 0 (i32.const 1))
        (i32.const 1)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)
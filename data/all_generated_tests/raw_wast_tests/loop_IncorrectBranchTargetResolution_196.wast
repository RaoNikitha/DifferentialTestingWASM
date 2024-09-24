;; 7. Develop a loop with nested `if` blocks that include conditional branches (`br_if`) targeting the loop itself. Verify that the `br_if` resolves the correct target based on the condition and label index, testing the correct interaction of labels between `if` and `loop`.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (local.set 0)
      (loop (result i32)
        (if (result i32)
          (local.get 0)
          (i32.const 1)
          (local.get 0)
          (br_if 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
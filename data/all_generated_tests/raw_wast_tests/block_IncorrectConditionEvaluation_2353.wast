;; Test Description 4: A sequence of instructions inside a `block` that manipulates the stack, followed by a `br_if` that depends on the final stack value. Ensure the `br_if` only branches if the computed stack value meets the expected condition.

(assert_invalid
  (module (func $test-block-seq-br_if
    (block (result i32)
      (i32.const 5)
      (i32.const 3)
      (i32.add)
      (i32.const 4)
      (i32.gt_s)
      (br_if 0)
    )
    (i32.const 1)
  ))
  "type mismatch"
)
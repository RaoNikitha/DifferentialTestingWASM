;; 4. A `block` enclosing a `loop` which ends on a `br_if` always evaluated as false due to incorrect condition checking. This tests the loop exit condition.

(assert_invalid
  (module (func $block-loop-br_if (result i32)
    (block (result i32)
      (loop (result i32)
        (i32.const 0)
        (br_if 1 (i32.const 1))
        (br 0)
      )
    )
  ))
  "type mismatch"
)
;; Implement a `block` where a `br_if` instruction branches to different blocks based on a simple comparison condition (e.g., top stack value greater than zero). Ensure correct condition comparisons and avoid always evaluating to true or false, leading to unintended branches.

(assert_invalid
  (module
    (func $test-block-br_if (result i32)
      (block (result i32)
        (i32.const 5)
        (block (result i32)
          (i32.const 6)
          (br_if 1 (i32.gt_s (i32.const 1) (i32.const 0)))
          (i32.const 7)
        )
        (i32.const 8)
      )
    )
  )
  "type mismatch"
)
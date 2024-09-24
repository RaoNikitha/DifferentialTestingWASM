;; 3. Construct a nested block structure where the inner block's condition uses `i32.eq` evaluation and branches outwards with `br_if`. Both incorrect and correct condition evaluations will highlight discrepancies in implementation.

(assert_invalid
  (module
    (func $nested-blocks (result i32)
      (block (result i32)
        (block (result i32)
          (i32.eq (i32.const 1) (i32.const 1))
          (br_if 1 (i32.const 0))
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)
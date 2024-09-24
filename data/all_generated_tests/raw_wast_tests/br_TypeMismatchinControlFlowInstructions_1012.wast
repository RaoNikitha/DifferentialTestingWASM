;; Test 3: Design a block with an expected result type of i32, but include a br instruction that attempts to leave the block and unwinds the stack placing an unexpected i64 type.

(assert_invalid
  (module
    (func $type-mismatch-block-br (result i32)
      (block (result i32)
        (br 0 (i64.const 42))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)
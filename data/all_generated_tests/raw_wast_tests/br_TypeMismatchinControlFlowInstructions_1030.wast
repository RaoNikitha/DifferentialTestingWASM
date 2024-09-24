;; Test 1: Define a block that outputs an integer but use a br instruction to exit the block, attempting to branch with a float instead of an integer.

(assert_invalid
  (module
    (func $type-mismatch-int-vs-float
      (block (result i32)
        (f32.const 1.0)
        (br 0)
      )
    )
  )
  "type mismatch"
)
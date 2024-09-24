;; 2. Design a block that incorrectly references an out-of-bounds label within a nested block using `br_if`, leading to an unreachable instruction if the branch is mistakenly taken.

(assert_invalid
  (module (func (result i32)
    (block
      (block
        (br_if 2 (i32.const 1))
      )
      (unreachable)
    )
  ))
  "unknown label"
)
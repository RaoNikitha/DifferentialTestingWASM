;; 8. Develop a block that uses local variables set before branching conditions with `br_if` to check if the condition evaluation accurately interprets local variable states within the block.

(assert_invalid
  (module (func $local-var-br_if-check (result i32)
    (local i32)
    (i32.const 1)
    (local.set 0)
    (block (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.eq)
      (br_if 0 (i32.const 0))
      (i32.const 2)
    )
  ))
  "type mismatch"
)
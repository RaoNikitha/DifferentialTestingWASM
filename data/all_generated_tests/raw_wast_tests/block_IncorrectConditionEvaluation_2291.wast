;; Use a `block` where the `blocktype` result type mismatches the actual stack state inside the block, and include a `br_if` instruction that must branch based on an evaluation of non-zero. Test if `br_if` evaluates correctly without mistakenly discarding the stack.

(assert_invalid
  (module (func $type-mismatch-block-br_if
    (result i32)
    (block (result i32)
      (i32.const 1)
      (br_if 0 (i32.const 1))
      (i64.const 2)
    )
  ))
  "type mismatch"
)
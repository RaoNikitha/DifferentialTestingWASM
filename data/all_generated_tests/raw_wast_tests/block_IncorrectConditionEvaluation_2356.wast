;; Test Description 7: A conditional `br_if` instruction inside a `block` that depends on a more complex condition (e.g., logical AND of two stack values). Verify that the condition is fully evaluated and the branch decision is correctly made.

(assert_invalid
  (module (func (result i32)
    (i32.and (i32.const 1) (i32.const 1))
    (block (result i32)
      (br_if 0 (i32.eq (i32.and (i32.const 1) (i32.const 1)) (i32.const 1)))
    )
  ))
  "type mismatch"
)
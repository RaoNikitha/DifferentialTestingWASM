;; 8. **Test Description 8**:    - Design a `loop` with a `br_if` instruction inside a conditional block to test nested conditional evaluations. The loop should only continue if an outer condition holds, focusing on layered condition evaluations.

(assert_invalid
  (module (func $nested-loop-conditional
    (i32.const 1)
    (block (result i32)
      (loop (result i32)
        (br_if 1 (i32.const 0))
        (br_if 0 (i32.const 1))
      )
    )
  ))
  "type mismatch"
)
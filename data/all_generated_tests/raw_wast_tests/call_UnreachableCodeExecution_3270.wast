;; Test 9: Use an inline-block within a function containing an 'unreachable' instruction, and check whether incorrect block termination logic in a called function reaches this instruction.

(assert_invalid
  (module
    (func $block-termination (result i32)
      (block
        (unreachable)
        (call 1 (i32.const 42))
      )
      (i32.const 0)
    )
    (func (param i32) (result i32) (i32.const 0))
  )
  "type mismatch"
)
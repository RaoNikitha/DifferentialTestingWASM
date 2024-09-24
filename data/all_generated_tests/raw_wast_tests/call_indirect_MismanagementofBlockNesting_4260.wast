;; 9. **Test Description**: A `call_indirect` instruction within a loop nested inside a block, where the loop condition modifies the operand stack. This test checks if an operand stack mismatch is trapped properly and ensures stack state consistency at different nesting points.

(assert_invalid
  (module
    (type $sig (func (param i32 i32)))
    (table 1 funcref)
    (func $test-loop-nested-block
      (block
        (loop
          (call_indirect (type $sig) (i32.const 0) (i32.const 2))
          (br_if 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)
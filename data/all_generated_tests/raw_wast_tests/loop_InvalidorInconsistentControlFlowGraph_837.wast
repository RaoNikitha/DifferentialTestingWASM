;; 8. Craft a sequence of loop instructions where the operand stack is improperly managed between nested loops, causing inconsistency in operand handling and CFG alignment.

(assert_invalid
  (module
    (func $nested-loop-op-stack
      (i32.const 1)
      (loop (result i32)
        (i32.const 2)
        (loop (result i32)
          (local.get 0)
          (br 1)
        )
        drop
      )
    )
  )
  "type mismatch"
)
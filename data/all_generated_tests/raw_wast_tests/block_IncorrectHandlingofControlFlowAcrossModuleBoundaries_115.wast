;; Use a block that immediately loops back to itself (infinite loop) and within this loop, call an imported function. Ensure the operand stack is correctly handled on every cycle of the loop, particularly focusing on the transition across module boundaries.

(assert_invalid
  (module 
    (import "env" "func" (func $imported (param i32) (result i32)))
    (func $type-infinite-loop-import (result i32)
      (i32.const 0)
      (block 
        (loop (result i32)
          (call $imported (i32.const 1))
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)
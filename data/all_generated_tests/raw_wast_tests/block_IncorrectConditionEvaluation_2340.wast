;; Test Description for Differential Behavior based on Incorrect Condition Evaluation:  1. Create a block with a `blocktype` that takes no inputs and produces an i32 result. Inside the block, initialize an i32 variable to 0, then use `br_if` to conditionally branch based on an i32 constant 1 (true). Check if the control flow skips or executes the intended instructions within the block.

(assert_invalid
  (module (func $condition-evaluation (result i32)
    (block (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 1))
      (i32.const 42)
    )
  ))
  "type mismatch"
)
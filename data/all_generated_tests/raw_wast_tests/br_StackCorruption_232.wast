;; 3. Implement a `loop` containing a `br` instruction that targets the loop itself, verifying backward jumps and operand stack consistency. Validate if all operand types required by the loop are appropriately handled on the stack to detect any incorrect operand restoration causing stack corruption.

(assert_invalid
  (module (func $loop-backward-branch-stack-operand-type (result i32)
    (loop $loop (result i32) (i64.const 42) (br 0) (drop) (i32.const 1))
  ))
  "type mismatch"
)
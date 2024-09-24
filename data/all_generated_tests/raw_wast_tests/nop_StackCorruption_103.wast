;; 4. Execute a sequence of instructions that manipulate the operand stack depth (e.g., pushing multiple values), interspersed with `nop`. Monitor the stack height before and after `nop` to ensure no unintended changes occur.

(assert_invalid
  (module
    (func $test (param i32) (local i32)
      local.get 0
      local.set 0
      nop
      i32.const 42
      local.set 0))
  "type mismatch"
)
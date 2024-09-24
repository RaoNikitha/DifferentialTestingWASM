;; Test a loop where a `br_if` instruction is used with a condition that is always false to ensure the CFG correctly identifies and avoids unnecessary backward jumps.

(assert_invalid
  (module (func $test-loop-br_if-always-false
    (loop (result i32)
      (if (result i32) (i32.const 0) (i32.const 1))
      (br_if 0 (i32.const 0)) (i32.const 42)
    )
  ))
  "type mismatch"
)
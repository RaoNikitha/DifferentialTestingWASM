;; Test a sequence where a `br_if` evaluates multiple conditions before encountering the `unreachable` instruction. Verify if any of the earlier conditions result in skipping the trap.

(assert_invalid
  (module (func $test-br_if-with-unreachable
    (block
      (br_if 0 (i32.eqz (i32.const 0))) 
      (unreachable)
      (i32.const 1)
    )
  ))
  "type mismatch"
)
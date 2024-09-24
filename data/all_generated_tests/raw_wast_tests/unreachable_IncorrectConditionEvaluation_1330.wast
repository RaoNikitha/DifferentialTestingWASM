;; 1. Test a simple conditional branch using `br_if` where the condition is always true. The presence of the `unreachable` instruction should immediately trigger a trap and prevent any conditional evaluation.

(assert_invalid
  (module (func $test-branch-unreachable
    (block
      (br_if 0 (i32.const 1))
      (unreachable)
      (i32.const 42)
    )
  ))
  "type mismatch"
)
;; 8. **Loop with Early Out Test**: Create a `loop` with an intended `br` that should exit the loop early and continue execution after the loop. Verify proper execution flow after the `end` of the loop is respected. This checks that the CFG correctly handles early exits from loops via `br`.

(assert_invalid
  (module
    (func
      (loop (i32.const 0) (br 1) (unreachable))
      (i32.const 1) (drop)
    )
  )
  "type mismatch"
)
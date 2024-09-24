;; 7. Test a `br` instruction within a `loop` that should direct execution to the `end` of the loop construct, ensuring it properly skips over an inner `unreachable` instruction.

(assert_invalid
  (module
    (func $br-to-end-of-loop-with-unreachable (result i32)
      (loop (result i32)
        (br 0)
        (unreachable)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)
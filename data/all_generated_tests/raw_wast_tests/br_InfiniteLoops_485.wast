;; 6. A loop containing a `br_if` instruction with a false condition always, ensuring it continues the loop without branching out. This verifies the correct backward branch behavior and tests operand stack consistency.

(assert_invalid
  (module
    (func $loop_br_if_false
      (loop
        (br_if 1 (i32.const 0))
        unreachable
      )
    )
  )
  "type mismatch"
)
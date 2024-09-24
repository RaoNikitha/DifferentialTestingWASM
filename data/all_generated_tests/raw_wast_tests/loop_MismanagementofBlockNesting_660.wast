;; - Test 1: Create a loop containing a nested if block that includes a `br_table` instruction branching directly to the loop. Verify if the correct branch target is selected depending on the condition. This test checks if the implementation correctly resets the control stack depth inside the loop when encountering nested if conditions.

(assert_invalid
  (module (func $nested-if-br_table
    (loop (result i32)
      (i32.const 1)
      (if
        (i32.eqz)
        (then (br_table 0 (i32.const 2)))
        (else)
      )
    )
  ))
  "type mismatch"
)
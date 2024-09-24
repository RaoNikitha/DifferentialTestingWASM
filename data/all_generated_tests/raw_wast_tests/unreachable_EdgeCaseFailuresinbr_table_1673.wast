;; 4. **Test 4:** Implement a `br_table` instruction inside a loop. Include an `unreachable` instruction before and within the loop, and ensure that the traps occur immediately, regardless of the loop's continuation.

(assert_invalid
  (module (func $test-br_table-after-unreachable
    (loop 
      (unreachable) 
      (br_table 0 0 (i32.const 0))
    )
  ))
  "type mismatch"
)
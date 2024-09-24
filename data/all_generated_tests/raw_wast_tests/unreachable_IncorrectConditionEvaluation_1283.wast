;; - **Test 4: If-Else Branch with Unreachable in Else Clause**   ```   Use an `if-else` structure where the `else` clause contains an `unreachable` instruction. Check if the `br_if` correctly evaluates whether to execute the `else` clause and trap. Incorrect condition handling may cause the wrong branch to execute, masking the trap.   ``` -

(assert_invalid
  (module (func $test-if-else-unreachable
    (block
      (br_if 0 (i32.const 1))
      (unreachable)
    )
  ))
  "type mismatch"
)
;; - **Test 3: Loop with Unreachable and Conditional Exit**   ```   Create a loop that has a `br_if` to exit conditionally and an `unreachable` instruction inside. If the condition to exit the loop is misinterpreted, it may loop indefinitely or reach the unreachable incorrectly, highlighting implementation discrepancies.   ``` -

(assert_invalid
  (module
    (func $loop_with_unreachable_and_conditional_exit
      (loop 
        (br_if 0 (i32.eq (i32.const 1) (i32.const 1)))
        (unreachable)
      )
    )
  )
  "type mismatch"
)
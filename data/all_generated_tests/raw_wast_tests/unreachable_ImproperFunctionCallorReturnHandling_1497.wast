;; 8. **Function with Unreachable Called in Loop:**    - **Test Description:** Create a loop that calls a function containing an `unreachable` instruction midway through its execution.    - **Constraint Checked:** Makes sure the loop is interrupted the moment `unreachable` in the function is hit.    - **Improper Handling Aspect:** Verifies loop control handling and that the `unreachable` trap inside the called function halts loop iterations.

(assert_invalid
  (module
    (func $unreachable_in_loop
      (loop
        (call $contains_unreachable)
        (br 0)
      )
    )
    (func $contains_unreachable
      (unreachable)
    )
  )
  "unreachable instruction must cause an immediate trap"
)
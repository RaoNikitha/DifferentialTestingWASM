;; 4. **Test 4**: Use a `br_if` instruction within a loop that pops a value from the stack to decide whether to branch to `unreachable`. Test the interaction by pushing multiple values on the stack and verify correct unwinding before reaching `unreachable`.

(assert_invalid
  (module
    (func $test-4
      (block
        (loop
          (i32.const 1) (i32.const 2)
          (br_if 0 (drop) (unreachable))
        )
      )
    )
  )
  "type mismatch"
)
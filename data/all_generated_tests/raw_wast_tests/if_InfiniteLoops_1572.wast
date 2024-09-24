;; 3. **Test 3**: Create a test where an `if` instruction conditionally jumps into a loop containing a `br` to the `if` block itself. Verify if state re-initialization prevents the loop from becoming infinite if `resetInit` is not properly applied.

(assert_invalid
  (module (func $test-loop-br-to-if
    (if (result i32) (i32.const 1)
      (then
        (loop (result i32)
          (if (i32.const 1) (then (br 1)))
          (i32.const 0)
        )
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)
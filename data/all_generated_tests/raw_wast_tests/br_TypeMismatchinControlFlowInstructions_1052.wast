;; 3. **Test 3: Loop with Incorrect Branch Type**    - Define a `loop` that should take `i32` values but includes a `br` instruction attempting to use `i64`.    - Verifies the proper type checking for branches targeting loops.    - Focuses on the forwarding of operand stack types as per loop’s input type requirements.

(assert_invalid
  (module
    (func $incorrect-loop-branch-type
      (loop (param i32)
        (i64.const 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)
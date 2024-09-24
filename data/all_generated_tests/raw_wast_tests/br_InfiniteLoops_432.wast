;; 3. **Test Description:** Design a loop whose continuation depends on a `br_if` instruction that branches to an invalid label. This should test the handling of undefined label targets, causing an infinite loop if the `br_if` fails to break correctly.

(assert_invalid
  (module
    (func $test-loop-invalid-label
      (loop
        (i32.const 0)
        (br_if 2 (i32.const 1)) 
      )
    )
  )
  "unknown label"
)
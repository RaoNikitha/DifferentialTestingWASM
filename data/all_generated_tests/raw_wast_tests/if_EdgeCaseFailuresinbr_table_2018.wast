;; 9. **Test 9**: A nested `if` instruction with an inner `else` branch containing a `br_table` instruction, ensuring the correct evaluation of nested contexts and proper jumping when indices are at bounds.

(assert_invalid
  (module
    (func $nested-if-with-br_table
      (block (if (then
        (i32.const 0)
        (block (if (else
          (br_table 0 0)
        )))
      )))
    )
  )
  "type mismatch"
)
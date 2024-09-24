;; 7. **Test 7**: An `if` instruction where the condition evaluates to false, running an `else` branch with a `br_table` that has indices exactly matching the exact number of possible targets but includes multiple invalid target indices.

(assert_invalid
  (module (func (param i32) (result i32)
    (if (result i32) (i32.const 0)
      (then (i32.const 1))
      (else (block (br_table 0 1 2) (i32.const 1)))
    )
  ))
  "out of bounds jump"
)
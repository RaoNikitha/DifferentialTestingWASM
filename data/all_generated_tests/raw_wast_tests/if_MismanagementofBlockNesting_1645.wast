;; 6. **Test 6**:    - An `if` block inside a `block`, which contains a `br_table` instruction targeting multiple depths within the nested structure.    - Evaluates if `br_table` correctly interprets nested block labels and branch points.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (then
            (block
              (br_table 1 0 (i32.const 1))
            )
          )
          (else
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)
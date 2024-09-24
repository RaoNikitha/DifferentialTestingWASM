;; 3. **Test Description**:     Define a loop with other nested control structures such as `if` and use a `br_table` instruction that includes corner-case indices like the lowest (`0`) and highest valid index, plus one invalid high index. Check whether these cases are handled correctly without incorrect label resolutions.    **Constraint**: Validate correct branching behavior at boundary index values.    **Relation to `br_table` Edge Cases**: Ensures correct execution flow and label resumption, focusing on boundary validation.

(assert_invalid
  (module
    (func $loop_with_if_br_table
      (block $outer
        (loop $inner (result i32)
          (block $if_then
            (if (i32.const 1) 
              (then
                (br_table 0 1 2 $inner)
              )
              (else
                (br_table 0 1 2 $inner)
              )
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "invalid label index"
)
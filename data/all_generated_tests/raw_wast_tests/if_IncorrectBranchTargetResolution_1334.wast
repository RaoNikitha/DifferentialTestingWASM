;; 5. **Cross-Functional Type `br` in `else` Block**:    - Design a function where the `else` block contains a `br` targeting a label from another function-type.    - Tests to catch mismatches caught by inspection of type bounds in label resolution.    - Ensures branch targets respect function boundaries and stack constraints.

(assert_invalid
  (module
    (func $cross_function_type_br_in_else 
      (block $outer
        (if (result i32) (i32.const 0)
          (then (i32.const 1))
          (else (br $outer (i32.const 2)))
        )
      )
    )
  )
  "type mismatch"
)
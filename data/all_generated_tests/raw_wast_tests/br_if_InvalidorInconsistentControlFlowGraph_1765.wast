;; 6. **Test Description**: Utilize an `if` block within a `loop` that contains a `br_if` targeting an outer `block`. Ensure the operand types match the expected result of the block upon conditional break.    - **Constraint Checked**: Correct target type handling in conditional and looping structures.    - **CFG Relation**: Validates whether CFG correctly interprets and manages complex conditional and looping escapes.

(assert_invalid
  (module
    (func $complex_structures
      (block $outer
        (loop $inner
          (if (i32.const 1)
            (then
              (br_if 1 (i32.const 1))))))
  ))
  "unknown label"
)
;; 8. Test a complex sequence of `block`, `loop`, and `if` instructions with a `br` targeting the middle `block`:    - **Constraint Checked**: Ensuring correct selection amongst multiple labels.    - **Incorrect Branch Target**: Wrong branch may lead to catastrophic flow errors.

(assert_invalid
  (module
    (func $complex-test
      (block $outer (result i32)
        (loop $inner (result i32)
          (block $target (result i32)
            (i32.const 10)
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)
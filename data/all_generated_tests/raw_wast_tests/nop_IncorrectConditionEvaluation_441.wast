;; 2. **Test with Multiple `nop` Instructions Preceding `br_if`**: Sequence multiple `nop` instructions before a `br_if` with a true condition. Verify that the branching occurs as intended without interference from the `nop` instructions.

(assert_invalid
  (module
    (func $test
      (block $label
        (nop)
        (nop)
        (nop)
        (br_if $label (i32.const 1))
        (result i32)
      )
    )
  )
  "type mismatch"
)
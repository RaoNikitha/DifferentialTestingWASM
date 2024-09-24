;; 5. Test a `br_if` instruction within a complex nested structure comprising multiple `block`, `loop`, and `if`, ensuring branching proceeds correctly when the condition is false and next instructions execute as expected.

(assert_invalid
  (module
    (func $complex-nested-structures
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (block (result i32)
            (br_if 2 (i32.const 0))
            (i32.const 0)
          )
          (i32.const 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
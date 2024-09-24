;; 3. **Test for Conditional Branch with Type Mismatch**: Design a loop containing a `br_if` instruction that conditionally branches to a block returning a value of a different type than what the loop expects.

(assert_invalid
  (module
    (func $type-mismatch-loop
      (block (result i32)
        (br_if 0 (i32.const 1))
        (loop (result f32)
          (f32.const 0.0)
        )
      )
    )
  )
  "type mismatch"
)
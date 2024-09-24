;; 2. Create a deeply nested structure with multiple `block`, `loop`, and `if` constructs and verify that `br 2`, intended to break from a second-level loop, correctly unwinds and exits to the appropriate point.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (loop (result i32)
              (br 2)
            )
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)
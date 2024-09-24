;; 3. **Test with Mixed Control Structures:**    Implement a combination of `block`, `loop`, and `if` within each other, and use the `br` instruction to break to different levels of these mixed structures. This checks the correct interpretation of the nesting depth across various control structures.

(assert_invalid
  (module
    (func $mixed-control-structures
      (block (result i32)
        (i32.const 42)
        (block (result i32)
          (loop (result i32)
            (if (result i32)
              (i32.const 1)
              (then (br 3)) ; Trying to jump to an outer block
            )
            (br 1) ; Jump to start of loop
          )
        )
      )
    )
  )
  "type mismatch"
)
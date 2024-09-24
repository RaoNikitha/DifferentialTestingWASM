;; 8. **Non-Well-Nested Control Flow Detection Test:**    Create a complex CFG with multiple mismatched `block`, `loop`, and `if` constructs, and insert a `br` that attempts to jump into a block. Test whether the implementation correctly rejects non-well-nested control flows.

(assert_invalid
  (module
    (func $non_well_nested_control_flow
      (block
        (loop
          (if (result i32)
            (then
              (br 1)
            )
            (else (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)
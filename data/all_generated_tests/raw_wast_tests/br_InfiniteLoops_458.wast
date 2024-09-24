;; Create a `loop` with deeply nested `block` and `loop` structures. Use `br` and `br_if` targeting various label indices to ensure correct branching without resultant infinite execution, verifying in-depth relative label referencing and stack unwinding.

(assert_invalid
  (module
    (func $deep_nesting
      (block
        (loop
          (block
            (loop
              (block (br 2))
              (block (br_if 1 (i32.const 1)))
              (block (br 1))
              (unreachable)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
;; 4. Use a `loop` with branches resolved through label indices where the loop contains both `block` and `if` instructions. Check accurate branch targeting among these structures.

(assert_invalid
  (module
    (func $test-func (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (block (result i32)
          (if (result i32)
            (i32.const 1)
            (then
              (br 1)
            )
            (else
              (br 0)
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)
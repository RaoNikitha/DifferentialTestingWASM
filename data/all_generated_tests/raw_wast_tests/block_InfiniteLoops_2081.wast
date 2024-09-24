;; 2. Generate a `block` containing a `loop` where an inner block has an `unreachable` instruction succeeded by a `br_if` that should normally exit the loop, but wizard_engine fails the condition handling.

(assert_invalid
  (module (func $loop-in-unreachable-branch (result i32)
    (block (result i32)
      (loop (result i32)
        (block (result i32)
          unreachable
          (br_if 1 (i32.const 1))
        )
        (br 1 (i32.const 2))
      )
    )
  ))
  "unreachable code error"
)
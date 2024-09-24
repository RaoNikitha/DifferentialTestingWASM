;; 2. **Test Description:** Design a nested `if` statement within a `block` where each `if` has a unique label. Use `br_if` to jump out of the first `if`, but keep an `unreachable` instruction outside the `block` to verify if the branch misinterprets label indices and erroneously reaches the `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-if-labels 
      (block
        (i32.const 0)
        (if (result i32)
          (then
            (br_if 0 (i32.const 1))
          )
          (else
            (br 1)
          )
        )
        (unreachable)
      )
    )
  )
  "unknown label"
)
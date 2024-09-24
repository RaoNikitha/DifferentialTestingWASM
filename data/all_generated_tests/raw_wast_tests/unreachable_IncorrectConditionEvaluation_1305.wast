;; 6. Place an `unreachable` instruction immediately before a `br_if` that relies on a local variable. Ensure that the `unreachable` causes an immediate trap and the `br_if`'s condition based on the local variable is evaluated correctly if `unreachable` is bypassed.

(assert_invalid
  (module
    (func $unreachable_br_if (param i32) (result i32)
      (unreachable)
      (block (result i32)
        (br_if 0 (local.get 0))
      )
    )
  )
  "type mismatch"
)
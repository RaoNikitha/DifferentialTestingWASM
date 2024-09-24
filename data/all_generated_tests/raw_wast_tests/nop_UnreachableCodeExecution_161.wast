;; 2. Place a `nop` inside a conditional block that contains an `unreachable` instruction to check if the condition properly bypasses the `unreachable` instruction due to `nop`.

(assert_invalid
  (module
    (func $conditional-unreachable
      (block
        (if (i32.const 0)
          (then (nop) (unreachable))
        )
      )
    )
  )
  "unreachable must not be bypassed"
)
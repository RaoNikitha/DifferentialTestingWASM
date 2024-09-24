;; 6. Place the `unreachable` instruction after a series of stack-manipulating instructions like `drop`, ensuring that it causes a trap regardless of the stack state prior.

(assert_invalid
  (module
    (func $type-after-manipulations-unreachable (result i32)
      (drop
        (i32.add
          (i32.const 1)
          (i32.const 2)
        )
      )
      unreachable
      br 0
    )
  )
 "type mismatch"
)
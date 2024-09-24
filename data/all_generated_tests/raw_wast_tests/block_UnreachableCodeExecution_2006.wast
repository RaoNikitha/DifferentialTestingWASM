;; 7. Construct a `block` that contains local variable modifications and branches to an `unreachable` instruction if the local variables do not meet the expected stack height and type upon re-entry, testing local variable handling within blocks.

(assert_invalid
  (module 
    (func (local i32)
      (block (result i32)
        (local.set 0 (i32.const 42))
        (br 0)
        (unreachable)
      )
    )
  )
  "type mismatch"
)
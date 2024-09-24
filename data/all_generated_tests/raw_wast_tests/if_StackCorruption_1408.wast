;; Create an `if` instruction where branches contain `unreachable` instructions that are supposed to trap immediately, checking if stack unwinding is correctly performed before the trap.

(assert_invalid
  (module (func $if-unreachable-stack-unwinding (param i32)
    (drop (if (result i32)
      (local.get 0)
      (then
        (unreachable)
      )
      (else
        (i32.const 1)
        (unreachable)
      )
    ))
  ))
  "type mismatch"
)
;; 2. Place a `nop` instruction within an `if-else` block, preceding each branch condition check (`br_if`). Confirm if either branch is incorrectly taken as a result of executing `nop`.

(assert_invalid
  (module (func (local i32)
    (nop)
    (if (result i32)
      (then (i32.const 1))
      (else (i32.const 0))
    )
    (br_if 0 (local.get 0))
  ))
  "type mismatch"
)
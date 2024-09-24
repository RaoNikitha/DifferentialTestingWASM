;; 1. Place a `nop` instruction immediately before a `br_if` instruction that should not branch under certain conditions. Verify that the branching behavior remains correct and is not affected by the presence of `nop`.

(assert_invalid
  (module
    (func $br_if_nop (param $x i32)
      (local $y i32)
      m (local.set $y (i32.const 0))
      (nop)
      (br_if 0 (i32.eqz (local.get $x)))
    )
  )
  "unreachable code"
)
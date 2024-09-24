;; 8. Use a `nop` instruction within a function's local variable conditional assignment followed by a `br_if`. Validate that the local variable assignment condition does not get incorrectly evaluated due to the presence of `nop`.

(assert_invalid
  (module
    (func $conditional_nop
      (local i32)
      (i32.const 1)
      (set_local 0)
      (nop)
      (local.get 0)
      (i32.eqz)
      (br_if 0)
    )
  )
  "type mismatch"
)
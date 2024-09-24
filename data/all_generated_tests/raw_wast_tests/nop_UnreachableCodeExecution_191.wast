;; Test 2: Use `nop` interspersed within a sequence of conditional branches that ultimately lead to an `unreachable` if all conditions fail. Ensure that the presence of `nop` does not affect the reachability of the `unreachable` instruction.

(assert_invalid
  (module
    (func $conditional-unreachable
      (block
        (if (i32.const 0)
          (then nop)
          (else nop)
        )
        (br 0)
      )
      (unreachable)
    )
  )
  "invalid conditional branch flow"
)
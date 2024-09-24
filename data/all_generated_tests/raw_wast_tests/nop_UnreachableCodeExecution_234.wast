;; 5. Test a combination of multiple `nop` instructions followed by an `unreachable` within a nested block structure to verify that execution flows correctly through the nops and only traps at `unreachable`.

(assert_invalid
  (module
    (func
      (block
        (nop)
        (nop)
        (unreachable)
      )
    )
  )
  "unreachable executed"
)
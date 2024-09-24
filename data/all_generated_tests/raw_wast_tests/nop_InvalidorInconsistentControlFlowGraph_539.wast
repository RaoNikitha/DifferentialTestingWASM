;; 10. Place `nop` sporadically within differently scoped functions and modules with interdependent calls, ensuring their output is unaffected and verifying no control flow anomalies when these functions inter-operate, hinting CFG discrepancies.

(assert_invalid
  (module
    (func $nested-nop
      (block
        (nop)
        (loop
          (nop)
          (br 1)
        )
        (nop)
      )
      (nop)
    )
  )
  "invalid block"
)
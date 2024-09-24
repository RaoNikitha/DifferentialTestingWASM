;; 9. Test a scenario where `nop` is included within a loop nested inside another loop. Check if `nop` prevents correct break or continuation, leading to infinite loops in complex control structures.

(assert_invalid
  (module
    (func $nested-loops
      (loop
        (loop
          (nop)
          (br 1)
        )
        (nop)
      )
    )
  )
  "unexpected stack behavior"
)
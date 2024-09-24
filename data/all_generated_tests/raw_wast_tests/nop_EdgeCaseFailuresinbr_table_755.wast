;; 6. Test a `nop` instruction within a loop containing a `br_table` with one of the targets pointing to an unreachable code block, confirming that both implementations properly skip the `nop` and successfully reach the `unreachable` target.

(assert_invalid
  (module
    (func
      (block $label0
        (loop $label1
          (br_table $label0 $label2 (unreachable))
          (nop)
        )
      )
      (unreachable)
    )
  )
  "unreachable executed"
)
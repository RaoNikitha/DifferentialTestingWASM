;; 8. Test Description: Place `nop` within a function body followed by multiple nested control flow constructs and an `unreachable`. Ensure validation handles `nop` appropriately and the `unreachable` results in trapping.

(assert_invalid
  (module 
    (func $nested-control (unreachable) 
      (block 
        (loop 
          (if 
            (then 
              (nop) 
              (br 1)
            )
          )
        )
      )
    )
  )
  "unreachable instruction must trap"
)
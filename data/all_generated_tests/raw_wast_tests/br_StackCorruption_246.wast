;; 7. **Test Description**: Use a sequence of `if-else` constructs where a `br` instruction points to an entry with a significantly different stack configuration. Observe how each implementation handles the branching and test for any resultant stack inconsistencies.

(assert_invalid
  (module (func $nested-if-else-with-br
    (block 
      ( if (i32.const 0)
        (then 
          (if (i32.const 1)
            (then (br 0)) 
            (else (nop))
          )
        ) 
        (else 
          (if (i32.const 1)
            (then 
              (br 1) 
            ) 
            (else (nop))
          )
        )
      )
    )
  ))
  "unknown label"
)
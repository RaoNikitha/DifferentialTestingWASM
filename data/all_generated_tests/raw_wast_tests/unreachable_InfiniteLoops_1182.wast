;; 3. Create a loop containing a sequence of valid instructions that eventually leads to `unreachable` within nested `if` conditions, ensuring the trap is triggered and no infinite loop occurs. Verify type consistency in this nested control flow.

(assert_invalid
  (module (func $type-loop-unreachable-nested-if (result i32)
    (loop
      (if (i32.const 1)
        (then 
          (if (i32.const 1)
            (then (unreachable))
            (else (i32.const 0))
          )
        )
        (else (i32.const 1))
      )
    )
  ))
  "type mismatch"
)
;; 8. Design an `if` block followed by a `loop` which contains another `if-else` structure. Employ `br_if` within the innermost `else` block to conditionally break out to the initial `if`. This tests the accurate maintenance of nested block contexts and proper reset of initial states.

(assert_invalid
  (module
    (func $nested-if-loop
      (if (result i32)
        (i32.const 1)
        (then
          (loop
            (if (i32.const 0) 
              (then)
              (else (br_if 1 (i32.const 0)))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)
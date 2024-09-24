;; 1. Test a nested loop structure where multiple `nop` instructions are placed at the entry and exit points of the loops. Check for any unexpected jumps or omitted loop iterations which could indicate inconsistent control flow.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (nop)
        (loop $inner
          (nop)
          (br $inner)  ;; Infinite inner loop to test for validation
        )
        (nop)
        (br $outer)  ;; Infinite outer loop to test for validation
      )
      (nop)
    )
  )
  "invalid instruction"
)
;; 5. Develop a loop with an expected early exit using `br` followed by an `if` condition inside the loop. If `br` incorrectly pops stack operands, the `if` condition may never be met, leading the loop to continue indefinitely without exiting.

(assert_invalid
  (module
    (func $loop_with_early_exit
      (block $exit
        (loop $loop
          (br_if $exit (i32.eqz (i32.const 0))) ; Conditional break to exit block
          (br $loop) ; Loop back to the start
        )
      )
    )
  )
  "type mismatch"
)
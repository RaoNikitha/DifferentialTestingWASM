;; 7. **Test Description: Place `nop` in a loop with a `block` and `br_if` to exit based on a condition checked in another block.**    - **Reasoning**: Validate that `nop` doesn't change the propagation of conditions.    - **Check**: The loop should terminate correctly when the exit condition is met.

 ;; (module
  (func $main
    (loop $outer
      (block $exit
        (block $check
          (br_if $exit (i32.const 1))
        )
        (nop)
        (br $outer)
      )
    )
  )
)
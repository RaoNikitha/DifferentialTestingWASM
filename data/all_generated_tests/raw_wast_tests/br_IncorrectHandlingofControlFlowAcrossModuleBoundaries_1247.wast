;; 8. **Test Description:**    - Export a function with alternating `if` statements and `loop` constructs, each containing `br` instructions.    - Import and call this function, ensuring that the combination of conditions and loops functions as expected without disrupting the control flow.    - **Constraint:** Validate that interleaved conditional and loop branches maintain correct execution flow when imported.

(assert_invalid
  (module
    (func $interleaved-if-loop
      (block
        (if (i32.const 1)
          (then
            (block (br 1))
          )
        )
        (loop
          (if (i32.const 0)
            (then
              (br 2)
            )
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)
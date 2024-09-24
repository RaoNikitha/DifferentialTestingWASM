;; 10. **Test Description: Include `nop` inside a loop with multiple `if-else` conditions determining loop exit via `br`.**     - **Reasoning**: Test if `nop` does not disrupt conditional branches used for loop control.     - **Check**: The loop should exit as expected based on `if-else` conditions.

 ;; (module 
  (func (param i32) (result i32)
    (local i32)
    (block
      (loop
        (local.set 0 (i32.const 1))
        nop
        (if (i32.eqz (local.get 0))
          (then
            (br 1)
          )
          (else
            (br 0)
          )
        )
      )
    )
    (local.get 0)
  )
)
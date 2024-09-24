;; 6. **Loop with Multiple Nops and External Break Condition**:    - Create a loop containing multiple `nop` instructions with the loop’s exit condition dependent on an external variable updated outside the loop. This will test if `wizard_engine` maintains correct context without falling into an infinite loop.    - Constraint: Loop control flow should respect external break conditions, unaffected by `nop`.

 ;; (module
  (global $break (mut i32) (i32.const 0))
  (func $loop
    (loop $loop_label
      (nop)
      (nop)
      (global.set $break (i32.const 1))
      (global.get $break)
      (br_if $loop_label (i32.eqz))
    )
  )
  (export "test" (func $loop))
)
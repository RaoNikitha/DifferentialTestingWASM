;; Strategically place `nop` within a chain of `block` and `loop` structures, ensuring stack types mismatches occur when control flow transitions between these structures. Check if wizard_engine proper type conformity validation fails.

(assert_invalid 
  (module 
    (func $test 
      (block (result i32) 
        (loop (result i32) 
          (nop)
          (br 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)